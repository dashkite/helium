registry = {}

register = (directory) ->
  for key, value of directory
    registry[key] = value

lookup = (key) -> registry[key]

export {register, lookup}
