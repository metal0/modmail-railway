const fs = require("fs");
const http = require('http');
const {MIGRATE_URL, DB_FILE} = process.env;

// https://stackoverflow.com/a/22907134
function download(url, dest, cb) {
  const file = fs.createWriteStream(dest);
  http.get(url, function(response) {
    response.pipe(file);
    file.on('finish', function() {
      file.close(cb);  // close() is async, call cb after close completes.
    });
  }).on('error', function(err) { // Handle errors
    fs.unlink(dest); // Delete the file async. (But we don't check the result)
    if (cb) cb(err.message);
  });
};


if(MIGRATE_URL?.length > 5 && DB_FILE) {
  download(MIGRATE_URL, DB_FILE)
}
