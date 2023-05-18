const express = require('express');
const bodyParser = require('body-parser');
// const dbCardCompanyRouter = require('./db-card-company');
// const accountRouter = require('./account');


const app = express();

app.set('port', process.env.PORT || 7777);

app.use(bodyParser.json({extended: true}));
app.use(bodyParser.urlencoded({extended:true}));

app.use(express.json());

// app.use('/db-card-company', dbCardCompanyRouter);
// app.use('/account', accountRouter);

app.use(require('./convert'));
app.use(require('./search'));
app.use(require('./account'));
//app.use(require('./codef-auth'));
console.log("들어옴");
app.use(require('./test')); //test용 파일

app.listen(app.get('port'), () => {
    console.log('Server listening on port', app.get('port'));
});
