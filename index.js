const express = require('express');

const app = express();

app.get("/", (req, res) => {
    res.send("<h2> ALHAMDULILLAH </h2>");
});

const port = process.env.PORT || 1337;
app.listen(port);

console.log("Server running at http://localhost:%d", port);