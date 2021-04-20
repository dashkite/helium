# singleton
$ = if window?
  window.__helium = {}
else if global?
  global.__helium = {}
else
  console.warn "helium: no shared context available"
  {}

export default

  set: (directory) ->
    $[key] = value for key, value of directory
    undefined

  get: (key) -> $[key]
