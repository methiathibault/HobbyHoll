const express = require('express');
const cors = require('cors');
const app = express();

const hobbyRoute = require('./routes/hobbyRoute');

app.use(cors());
app.use(express.json());

app.use('/api/hobbies', hobbyRoute);

app.listen(3001, () => {
    console.log('Server is running on port 3001');
});