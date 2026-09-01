const test = require("node:test");
const assert = require("node:assert");
const { greeting } = require("./index");

test("greeting returns the expected fixture string", () => {
  assert.strictEqual(greeting(), "hello from actions test fixture");
});
