import * as fs from 'fs';
import fetch from 'node-fetch';
const {MIGRATE_URL, DB_FILE} = process.env;

const downloadFile = (async (url, path) => {
  const res = await fetch(url);
  const fileStream = fs.createWriteStream(path);
  await new Promise((resolve, reject) => {
      res.body.pipe(fileStream);
      res.body.on("error", reject);
      fileStream.on("finish", resolve);
    });
});

if(MIGRATE_URL?.length > 5 && DB_FILE?.includes("data.sqlite")) {
  console.info("Downloading migration file...");
  await downloadFile(MIGRATE_URL, DB_FILE);
  console.info("Done!");
  //process.exit(1);
}
