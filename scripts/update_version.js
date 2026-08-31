const fs = require('fs');

function jsonReader(filePath, cb) {
    fs.readFile(filePath, 'utf-8', (err, fileData) => {
        if(err) {
            return cb && cb(err);
        }
        try {
            const object = JSON.parse(fileData);
            return cb && cb(null, object);
        } catch (err) {
            return cb && cb(err);
        }
    });
}

jsonReader('./package.json', (err, data) => {
    if(err){
        console.log(err);
    } else {
        let version = data.version.split('-');
        // version[1] is the build counter (e.g. "3.0.11-4" -> "3.0.11-5").
        // When the base version has no counter suffix (e.g. plain "3.0.11"),
        // parseInt(undefined) is NaN - start a fresh counter at 1 instead of
        // producing "3.0.11-NaN" (see MOBILE-5071).
        const nextCounter = parseInt(version[1]);
        version[1] = Number.isNaN(nextCounter) ? 1 : nextCounter + 1;
        data.version = version.join('-');
        fs.writeFile('./package.json', JSON.stringify(data, null, 2), err => {
            if(err) {
                console.log(err);
            }
        })
    }
})