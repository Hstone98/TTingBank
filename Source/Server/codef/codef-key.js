const {Router} = require('express');
const router = Router();

const SENDBOX_CLIENT_ID = 'ef27cfaa-10c1-4470-adac-60ba476273f9';
const SENDBOX_CLIENT_SECRET = '83160c33-9045-4915-86d8-809473cdf5c3';

//코드에프 가입을 통해 발급 받은 클라이언트 정보 - 데모
const DEMO_CLIENT_ID = '46a1384a-b3f5-4562-884b-42e131d00417';
const DEMO_CLIENT_SECRET = '25e56a19-87e0-4f18-a67b-a743ef0b3788';

// 코드에프 가입을 통해 발급 받은 클라이언트 정보- 정식
const CLIENT_ID = '';
const CLIENT_SECRET = '';

//	코드에프 가입을 통해 발급 받은 RSA 공개키 정보
const PUBLIC_KEY = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsPUBYBaCoHfnZA0vjfbArkiHts8SBVx1NCiSRmwVuKV341Oj80Csyx0mUdnv3agIRPG3puYMi2wbe+ZCAjXA7rttKN1rldidAcbqdth+tuL9WAVr4wPJ3eCJVkulghN7Gx5Y0bQr1YB3s/2rY87R17D/uFI0hjfF5ZmUtSFbLk2jh+MY1ToM+vQfrwlQNfTpNljjR6Hkd1lRKuDjth1z/KsEwP75baASRV+Pj4RePJE8u2Pqt4vYrLHMhnbOwVtuNSirG82sgJjgrq8QB2Jl71yYzwpg1UABOs7CrNbvtNm9xTswzTIXf7mQpPncryvk7To3d7QniWwUqLuiC4SzwQIDAQAB';

module.exports = router;