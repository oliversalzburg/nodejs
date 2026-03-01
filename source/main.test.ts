import assert from "node:assert";
import { describe, it } from "node:test";
import { nothing } from "./main.js";

describe("main", () => {
  it("should export nothing", () => {
    assert.strictEqual(nothing, null);
  });
});
