# singleton
$ = {}

export default

  add: (directory) -> $[key] = value for key, value of directory; directory

  get: (key) -> $[key]
