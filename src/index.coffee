# singleton
$ = globalThis["@dashkite/helium"] ?= new Map

class Resolver
  @create: -> new @
  constructor: ->
    self = @
    @promise = new Promise (resolve, reject) ->
      self.resolve = resolve
      self.reject = reject

export default

  set: (dictionary) ->
    for key, value of dictionary
      if $.has key
        _value = $.get key
        if _value.constructor == Resolver
          _value.resolve value
      $.set key, value


  get: (key) ->
    if $.has key
      $.get key
    else
      resolver = Resolver.create()
      $.set key, resolver
      resolver.promise
