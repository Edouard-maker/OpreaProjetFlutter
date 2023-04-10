const functions = require('firebase-functions');
const axios = require('axios');

exports.getGameInfo = functions.https.onCall(async (data, context) => {
  const apiKey = '8B87358D89172DB1EB993B9F52BDC5BD';
  const appId = data.appId;
  const response = await axios.get(
    `https://store.steampowered.com/api/appdetails?appids=${appId}&cc=us&l=en&json=1&key=${apiKey}`
  );
  if (response.status === 200 && response.data[`${appId}`]['success']) {
    return response.data[`${appId}`]['data'];
  }
  throw new functions.https.HttpsError(
    'internal',
    'Error fetching game info from Steam API'
  );
});
