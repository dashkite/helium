# Helium

Share values across modules without polluting the global scope.

```coffee
original = foo: "bar"

Registry.set test: original

returned = Registry.get "test"
```

## Install

```
npm i @dashkite/helium
```

Bundle with your favorite bundler. You can bundle the CoffeeScript directly to compile it with your settings by using `coffee:main` as the entry point.

## API

### `get key → value`

Return the value associated with the given key.

### `set dictionary → ~`

For each key-value pair in the dictionary, set the value associated with the key.

```coffeescript
Registery.set
  foo: "apples"
  bar: "bananas"
```
