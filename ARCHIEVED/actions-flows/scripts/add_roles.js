/**
 * Handler that will be called during the execution of a PostLogin flow.
 *
 * @param {Event} event - Details about the user and the context in which they are logging in.
 * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
 */
const LOAN_OFFICER_ROLE_ID = "rol_Vp7wm1UhdkmJXMm3";
const CONSUMER_ROLE_ID = "rol_H0sE4gx0Hk6dQKAO";
const Project_UAT_CLIENT_ID = "tdU3jHzxVMccYflANOUmkrsc9e9D13u3";

exports.onExecutePostLogin = async (event, api) => {
  if (event.authorization && event.authorization.roles) {
    const ManagementClient = require("auth0").ManagementClient;

    var management = new ManagementClient({
      domain: event.secrets.domain,
      clientId: event.secrets.clientId,
      clientSecret: event.secrets.clientSecret,
    });
    const axios = require("axios");

    try {
      const userId = event.user.user_id;
      const params = { id: userId };
      const clientId = event.request.query.client_id;
      const urlDomain =
        clientId === Project_UAT_CLIENT_ID
          ? "https://uat-api.project.com"
          : "https://dev-api.project.com/";
      const url = `${urlDomain}/user/is_loan_officer/${userId.slice(6)}`;
      const options = {
        headers: {
          "Content-Type": "application/json",
        },
      };
      console.log("IS LOAN OFFICER ===> ", url);
      const is_loan_officer = await axios.get(url, options);
      console.log(is_loan_officer.data);
      let data;
      let rolesToRemove;
      if (clientId === Project_UAT_CLIENT_ID) {
        if (is_loan_officer.data === true) {
          data = { roles: [LOAN_OFFICER_ROLE_ID] };
        } else {
          data = { roles: [CONSUMER_ROLE_ID] };
        }
      } else {
        if (event.user.app_metadata.roleId === 1) {
          data = { roles: [LOAN_OFFICER_ROLE_ID] };
          rolesToRemove = { roles: [CONSUMER_ROLE_ID] };
        } else {
          data = { roles: [CONSUMER_ROLE_ID] };
          rolesToRemove = { roles: [LOAN_OFFICER_ROLE_ID] };
        }
        await management.users.deleteRoles(params, rolesToRemove);
      }
      await management.users.assignRoles(params, data);
    } catch (e) {
      console.log("error", e);
    }
  }
};

/**
 * Handler that will be invoked when this action is resuming after an external redirect. If your
 * onExecutePostLogin function does not perform a redirect, this function can be safely ignored.
 *
 * @param {Event} event - Details about the user and the context in which they are logging in.
 * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
 */
// exports.onContinuePostLogin = async (event, api) => {
// };
