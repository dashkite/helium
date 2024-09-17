import Value from "./value"

$ = globalThis[ "@dashkite/helium" ] ?= new Map

Registry =

  get: ( key ) ->
    do ({ value } = {}) ->
      if ( $.has key )
        value = $.get key
      else
        value = Value.promise()
        $.set key, value
      value.get()

  has: ( key ) -> $.has key

  set: ( key, _value ) ->
    if ( $.has key )
      value = $.get key
      value.set _value
    else
      $.set key, Value.from _value
    _value

  observe: ( key, handler ) ->
    value = $.get key
    value.observe handler
    handler

export default Registry

