# singleton
$ = (window ? global)["@dashkite/helium"] ?= {}

export default

  set: (directory) ->
    $[key] = value for key, value of directory
    undefined

  get: (key) -> $[key]
