###
 * driver: led
 * cylonjs.com
 *
 * Copyright (c) 2013 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';
EventEmitter = require('events').EventEmitter
Adaptor = require('../adaptor.coffee')

module.exports = class Led extends EventEmitter
  adaptor: new Adaptor()
  pin: 0
  is_on: false
  is_off: false

  constructor: (pin) ->
    @pin = pin

    this.register_event('digital_write_on')
    this.register_event('digital_write_off')

  turn_on: ->
    @is_on = true
    @is_off = false

    @adaptor.digital_write(@pin, 1)

  turn_off: ->
    @is_on = true
    @is_off = false

    @adaptor.digital_write(@pin, 0)

  register_event: (event_name) ->
    switch event_name
      when 'digital_write_on'
        @adaptor.on('digital_write_on', => this.emit("turn_on") )
      when 'digital_write_off'
        @adaptor.on('digital_write_off', => this.emit("turn_off") )

#Led.prototype.__proto__ = EventEmitter.prototype
#util.inherits(Led, EventEmitter)
