const express = require("express");
const app = express();
const router = express.Router();

const path = __dirname + '/views/';

// app.get("/", (req, res) => {
//     res.send("<h2> ALHAMDULILLAH </h2>");
// });

router.use(function (req,res,next) {
    console.log('/' + req.method);
    next();
});
  
router.get('/', function(req,res){
    res.sendFile(path + 'index.html');
});

app.use(express.static(path));
app.use('/', router);
  
const port = process.env.PORT || 1337;

app.listen(port, () => console.log('Listening on port ${port}'))