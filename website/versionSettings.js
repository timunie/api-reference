// @ts-check
const fs = require('node:fs');

export const versionSettings = {
    current: fs.readFile('./../AvaloniaVersion.txt'),
};