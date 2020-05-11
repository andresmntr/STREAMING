var express = require('express');
var app = express();
var cors = require('cors');

app.use(cors());

app.get('/keys', async (req, res) => {
	return res.status(200).send({
		'org.w3.clearkey': {
			clearkeys: {
				oW5AK5BW43HzbTSKpiu3SQ: 'hyN9IKGfWKdAwFaE5pm0qg'
			}
		}
	});
});

app.listen(3000, () => {
	console.log('Server running on port 3000');
});
