function remove(id, callback) {
  const { Client } = require("pg");
  const connectionString = configuration.DATABASE_URI;
  const client = new Client({
      connectionString: connectionString,
      ssl: {
          rejectUnauthorized: true,
      },
  });

  // List of queries to execute in the transaction
  const queries = [
      'DELETE FROM "UserFeesWorksheet" WHERE "userProfileId" IN (SELECT "userProfileId" FROM "UserProfiles" WHERE "userId" = $1)',
      'DELETE FROM "UserDocuments" WHERE "userProfileId" IN (SELECT "userProfileId" FROM "UserProfiles" WHERE "userId" = $1)',
      'DELETE FROM "UserREOs" WHERE "userProfileId" IN (SELECT "userProfileId" FROM "UserProfiles" WHERE "userId" = $1)',
      'DELETE FROM "ApplicationPurchaseHomes" WHERE "userId" = $1',
      'DELETE FROM "UserEmploymentAndIncomes" WHERE "userId" = $1',
      'DELETE FROM "UserDemographics" WHERE "userId" = $1',
      'DELETE FROM "UserLiabilities" WHERE "userId" = $1',
      'DELETE FROM "UserREOs" WHERE "userId" = $1',
      'DELETE FROM "UserAssets" WHERE "userId" = $1',
      'DELETE FROM "ApplicationDeclarations" WHERE "userId" = $1',
      'DELETE FROM "UserProfiles" WHERE "userId" = $1',
      'DELETE FROM "ProductAndPricing" WHERE "applicationId" IN (SELECT "applicationId" FROM "Applications" WHERE "userId" = $1)',
      'DELETE FROM "CreditSetup" WHERE "applicationId" IN (SELECT "applicationId" FROM "Applications" WHERE "userId" = $1)',
      'DELETE FROM "Quote" WHERE "applicationId" IN (SELECT "applicationId" FROM "Applications" WHERE "userId" = $1)',       
      'DELETE FROM "ProductAssignedRate" WHERE "applicationId" IN (SELECT "applicationId" FROM "Applications" WHERE "userId" = $1)',        
      'DELETE FROM "Applications" WHERE "userId" = $1',
      'DELETE FROM "OnboardingProfiles" WHERE "userId" = $1',
      'UPDATE "Users" SET "lenderId" = NULL WHERE "lenderId" = $1',
      'UPDATE "Applications" SET "lenderId" = NULL WHERE "lenderId" = $1',
      'UPDATE "OnboardingProfiles" SET "lenderId" = NULL WHERE "lenderId" = $1',
      'DELETE FROM "Users" WHERE "userId" = $1'
  ];

  client.connect((err) => {
      if (err) {
          return callback(err);
      }

      client.query('BEGIN', (beginErr) => {
          if (beginErr) {
              console.log(beginErr);
              return callback(new Error('Transaction begin error.'));
          }

          // Execute all delete queries in a transaction
          const deletePromises = queries.map((query) => {
              return new Promise((resolve, reject) => {
                  client.query(query, [id], (queryErr, result) => {
                      if (queryErr) {
                          return reject(queryErr);
                      }
                      resolve(result);
                  });
              });
          });

          // Commit if all queries succeed, else rollback on error
          Promise.all(deletePromises)
              .then(() => {
                  client.query('COMMIT', (commitErr) => {
                      if (commitErr) {
                          console.log(commitErr);
                          return callback(new Error('Transaction commit error.'));
                      }
                      return callback(null);  // Success
                  });
              })
              .catch((queryErr) => {
                  client.query('ROLLBACK', (rollbackErr) => {
                      if (rollbackErr) {
                          console.log(rollbackErr);
                      }
                      return callback(queryErr);  // Return the error that caused the rollback
                  });
              });
      });
  });
}