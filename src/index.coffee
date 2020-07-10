# singleton
$ = {}

export default

  set: (directory) ->
    $[key] = value for key, value of directory; directory
    undefined

  get: (key) -> $[key]
