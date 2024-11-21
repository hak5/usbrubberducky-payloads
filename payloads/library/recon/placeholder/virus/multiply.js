const fs = require('fs');

const currentDirectory = process.cwd();

fs.readdir('./', (err, files) => {
    if (err) throw err;
    console.log(files);
});

