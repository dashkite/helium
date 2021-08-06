import assert from "@dashkite/assert"
import { test } from "@dashkite/amen"
import $ from "../../src"

do ->

  window.__test = await do ->

    test "Helium", [

      test "Basic Set/Get", ->
        $.set foo: "bar"
        assert.equal "bar", await $.get "foo"
      
      test "Get Before Set", ->
        promised = $.get "bar"
        $.set bar: "foo"
        assert.equal "foo", await promised

      test "Compound Keys", do ->

        $.set foo: bar: "baz"

        [

          test "Array", ->
            console.log await $.get [ "foo", "bar" ]
            assert.equal "baz",
              await $.get [ "foo", "bar" ]

          test "String", ->
            assert.equal "baz",
              await $.get "foo.bar"

        ]

    ]
