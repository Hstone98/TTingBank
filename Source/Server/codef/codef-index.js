const express = require('express');
const bodyParser = require('body-parser');
const codef_http = require('./codef-http');
const codef_account = require('./codef-accont');
const codef_auth = require('./codef-auth-test');
const codef_card = require('./codef-card');
const codef_key = require('./codef-key');
const codef_token = require('./codef-token');
const codef = require('');


const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));



//--------------------------------------------------------------//
// test code.
//--------------------------------------------------------------//

// const KEY = require("./codef-key")
app.use(express.json());
app.use(codef);
app.use(codef_token);
app.use(codef_http);
app.use(codef_account);
// app.use(codef_auth);
app.use(codef_card);
app.use(codef_key);


// app.use(codef_http.httpSender(codef_url + account_list_path, token, codef_api_body));

module.exports = app;