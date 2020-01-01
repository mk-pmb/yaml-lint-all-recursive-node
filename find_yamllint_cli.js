/*jslint indent: 2, maxlen: 80, continue: false, unparam: false, node: true */
'use strict';
var ylp = 'yaml-lint/', cli = require(ylp + 'package.json').bin;
cli = (cli.yamllint || cli);
console.log(require.resolve(ylp + cli));
