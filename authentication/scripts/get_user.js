function getByEmail(email, callback) {
  console.log("IN GET USER")
    const connectionString = configuration.DATABASE_URI;
      const { Client } = require("pg");
    const client = new Client({
      connectionString: connectionString,
      ssl: {
        rejectUnauthorized: true,
      },
    });
    client.connect((err) => {
      if (err) {
        console.log("GET USER ERROR 1===> ", err)
        return callback(err);
      }
  
      const query = `SELECT "userId", "email" FROM "Users" WHERE email = $1`;
      client.query(query, [email], (err, result) => {
        client.end();
        if (err) {
          console.log("GET USER ERROR ===> ", err)
          return callback(new Error(err.message));
        } else if (result.rows.length === 0) {
          return callback(null);
        }
        const user = result.rows[0];
            console.log("user ", user)
        const returnUser = {
        "id": `${user.userId}`,
        "email": user.email
        }
        return callback(null, returnUser);
      });
    });
  }