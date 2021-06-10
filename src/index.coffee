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
      old = $.get key if $.has key
      # set value before resolving promise,
      # since that could lead to calling get
      $.set key, value
      old.resolve value if old?.constructor == Resolver
    undefined

  get: (key) ->
    if $.has key
      if (value = $.get key)?.constructor == Resolver
        value.promise
      else
        value
    else
      resolver = Resolver.create()
      $.set key, resolver
      resolver.promise
