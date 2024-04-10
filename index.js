import { createRequire } from 'module'
import assert from 'assert';

const require = createRequire(import.meta.url)
const path = process.argv[2];
if (!path) {
    throw new Error('Pass native module as first argument.');
}

const expected = 200000;
const value = require(path);
console.log('Got value:', value);
assert.strictEqual(value, expected);

