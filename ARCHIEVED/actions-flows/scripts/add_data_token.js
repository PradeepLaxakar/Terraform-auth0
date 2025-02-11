/**
 * Handler that will be called during the execution of a PostLogin flow.
 *
 * @param {Event} event - Details about the user and the context in which they are logging in.
 * @param {PostLoginAPI} api - Interface whose methods can be used to change the behavior of the login.
 */
const Project_UAT_CLIENT_ID = "tdU3jHzxVMccYflANOUmkrsc9e9D13u3";
const ALWAYS_ONBOARDING_USER_ID_DEV = "1";
const ALWAYS_ONBOARDING_USER_ID_UAT = "4";

exports.onExecutePostLogin = async (event, api) => {
  try {
    const axios = require("axios");
    console.log(event.user.app_metadata);
    const metaData = event.user.app_metadata;
    const provider = event.user.user_id.split("|")[0];
    const userId = event.user.user_id.split("|")[1];
    const firstName =
      metaData?.firstName ||
      event.user?.user_metadata?.firstName ||
      event.user?.given_name ||
      event.user?.name ||
      "Consumer";
    const lastName =
      metaData?.lastName ||
      event.user?.user_metadata?.lastName ||
      event.user?.family_name ||
      "";
    const phoneNumber =
      metaData?.phoneNumber ||
      event.user?.user_metadata?.phoneNumber ||
      event.user?.phone_number ||
      "";
    const emailVerified = event.user?.is_Verified === "1" ? 1 : 0;
    const clientId = event.request.query.client_id;
    const urlDomain =
      clientId === Project_UAT_CLIENT_ID
        ? "https://uat-api.project.com"
        : "https://dev-api.project.com";
    const alwaysOnboardingUserId =
      clientId === Project_UAT_CLIENT_ID
        ? ALWAYS_ONBOARDING_USER_ID_UAT
        : ALWAYS_ONBOARDING_USER_ID_DEV;
    const roleId = metaData?.roleId;
    if (userId === alwaysOnboardingUserId) {
      const url = `${urlDomain}/user/application/${userId}`;
      const options = {
        headers: {
          "Content-Type": "application/json",
        },
      };
      await axios.delete(url, options);
    }

    //call api to check is user logging in for the first time,
    const url = `${urlDomain}/user/is_first_time_user`;
    const options = {
      headers: {
        "Content-Type": "application/json",
      },
    };
    const data = {
      user_id: userId,
      source: provider,
      email: event.user.email,
      first_name: firstName,
      last_name: lastName,
    };

    const response = await axios.post(url, data, options);

    // add claims to token
    api.accessToken.setCustomClaim("user_id", response.data.data.user_id);
    api.accessToken.setCustomClaim("user_email", event.user.email);
    api.accessToken.setCustomClaim("first_name", firstName);
    api.accessToken.setCustomClaim("last_name", lastName);
    api.accessToken.setCustomClaim("user_phone_number", phoneNumber);
    api.accessToken.setCustomClaim("email_verified", emailVerified);
    api.accessToken.setCustomClaim("roleId", roleId);
    // add mobile number claim
    if (response.data && response.data.data) {
      api.accessToken.setCustomClaim("new_user", response.data.data.new_user);
      api.accessToken.setCustomClaim(
        "user_profile_exists",
        response.data.data.user_profile_exists
      );
      api.accessToken.setCustomClaim(
        "pending_application_id",
        response.data.data.pending_application_id
      );
      // if (!response.data.data.new_user) {
      //   api.accessToken.setCustomClaim("first_name", response.data.data.first_name ?? firstName);
      //   api.accessToken.setCustomClaim("last_name", response.data.data.last_name ?? lastName);
      // }
    }
  } catch (e) {
    console.log("Error ===> ", e);
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
