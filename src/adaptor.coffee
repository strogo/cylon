###
 * adaptor
 * cylonjs.com
 *
 * Copyright (c) 2013 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';
events = require('events')
fs = require('fs')

module.exports = class Adaptor
  event_emitter: new events.EventEmitter()

  constructor: (opts) ->

  digital_write: (pin, level) ->
    stream = fs.createWriteStream('./gpio_test')


    stream.once('open', (fd) =>
      stream.write("#{pin} #{level}\n")
      stream.close

      @event_emitter.emit('digital_write_on') if level is 1
      @event_emitter.emit('digital_write_off') if level is 0
    )
