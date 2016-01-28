var fs = require('fs');
var through = require('through');
var deamdify = require('deamdify');

module.exports = function (file, options) {
    var data = '';
    var stream = through(write, end);
    return stream;

    function write(buf) { data += buf }

    function end() {
        console.log("data:::", data);
        // data = deamdify(data);
        stream.queue(data);
    }

    // deamdify(data)

    function func(data) {
        console.log('Line: ' + data);
    }
}