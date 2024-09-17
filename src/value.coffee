class Value

  @from: ( value ) ->
    self = new Value
    self.value = value
    self
  
  @promise: ->
    self = new Value
    self.promise = new Promise ( resolve ) ->
      self.resolve = resolve
    self
  
  constructor: -> 
    @handlers = []

  get: -> @promise ? @value

  set: ( @value ) ->
    if @promise?
      @resolve @value
      { @resolve, @promise } = {}
    handler @value for handler in @handlers
    @value

  observe: ( handler ) -> @handlers.push handler

export default Value