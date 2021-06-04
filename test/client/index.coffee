import assert from "@dashkite/assert"
import * as a from "@dashkite/amen"
import Registry from "@dashkite/helium"

do ->

  window.__test = await a.test "Helium", [

    a.test "add/set", ->
      original = foo: "bar"
      Registry.set test: original
      returned = Registry.get "test"
      assert.equal original, returned
  ]
