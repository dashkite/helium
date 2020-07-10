import assert from "assert"
import {print, test, success} from "amen"
import Registry from "../src"

do ->

  print await test "helium", [

    test "add/set", ->

      original = foo: "bar"

      Registry.set test: original

      returned = Registry.get "test"

      assert.equal original, returned
  ]
