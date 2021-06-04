import { test } from "@dashkite/amen"
import print from "@dashkite/amen-console"
import * as _ from "@dashkite/joy"
import * as k from "@dashkite/katana"
import * as m from "@dashkite/mimic"
import browse from "@dashkite/genie-presets/browse"

do ->

  await do browse ({browser, port}) ->
    do m.launch browser, [
      m.page
      m.goto "http://localhost:#{port}/"
      m.waitFor -> window.__test?
      m.evaluate -> window.__test
      k.peek (result) -> print result
    ]
