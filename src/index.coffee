import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as T from "@dashkite/joy/type"
import * as Obj from "@dashkite/joy/object"
import * as It from "@dashkite/joy/iterable"
import * as Tx from "@dashkite/joy/text"

# singleton
$ = globalThis["@dashkite/helium"] ?= new Map

class Resolver
  @create: -> new @
  constructor: ->
    self = @
    @promise = new Promise (resolve, reject) ->
      self.resolve = resolve
      self.reject = reject


isCompoundKey = Tx.isMatch /\./

get = generic
  name: "get"
  description: "Get a value from the registry with a (possibly compound) key."

generic get, T.isString, (key) ->
  if $.has key
    if (value = $.get key)?.constructor == Resolver
      value.promise
    else
      value
  else
    resolver = Resolver.create()
    $.set key, resolver
    resolver.promise

generic get, isCompoundKey, (key) ->
  get Tx.split ".", key

generic get, T.isArray, ([key, keys...]) ->
  It.reduce (Fn.flip Obj.get), (await get key), keys

export default

  get: get

  set: (dictionary) ->
    for key, value of dictionary
      old = $.get key if $.has key
      # set value before resolving promise,
      # since that could lead to calling get
      $.set key, value
      old.resolve value if old?.constructor == Resolver
    undefined

