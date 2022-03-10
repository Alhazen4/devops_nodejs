const http = require('http');
const fs = require('fs')

const server = http.createServer((request, response) => {
    fs.readFile('index.html', function(error, data) {
        response.writeHead(200, {"Content-Type": "text/html"});
        if (error) {
            response.writeHead(404)
            response.write('Error')
        } else {
            response.write(data)
        }
    })
    response.end();
});

const port = process.env.PORT || 1337;
server.listen(port);

console.log("Server running at http://localhost:%d", port);