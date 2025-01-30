# Helium

_In-memory key-value store_

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

```
import Registry from "@dashkite/helium"

do ->

  Registry.set "foo", "bar"
  assert.equal "bar", await Registry.get "foo"
  
  # conditional set
  assert.equal "bar", Registry.setc "foo", "baz"
```

## API

### get

_get key ⇢ value_

Get a value from the registry.

Given a key, returns a promise that will resolve to the corresponding value, if and when it is set.

### set

_set key, value → value_

Set a value in the registry.

Given a key and a value, sets the value corresponding to the key, returning the value and resolving any promises awaiting on it.

### getc

_getc key → value_

Conditionally get a value from the registry.

Given a key, returns the corresponding value if one exists or `undefined`.

### setc

_setc key, value → value_

Conditionally set a value in the registry.

Given a key and a value:

- Behaves like `set` when no value corresponding to the key exists
- Returns the value corresponding to the key when it exists
