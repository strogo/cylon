###
 * driver: led
 * cylonjs.com
 *
 * Copyright (c) 2013 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';
events = require('events')
Adaptor = require('../adaptor.coffee')

module.exports = class Led
  event_emitter: new events.EventEmitter()
  adaptor: new Adaptor()
  pin: 0
  is_on: false
  is_off: false

  constructor: (pin) ->
    @pin = pin
    this.add_event_listener('digital_write_on')
    this.add_event_listener('digital_write_off')

  on: ->
    @is_on = true
    @is_off = false

    @adaptor.digital_write(@pin, 1)

  off: ->
    @is_on = true
    @is_off = false

    @adaptor.digital_write(@pin, 0)

  when_on: (callback) ->
    @event_emitter.on("on", callback)

  when_off: (callback) ->
    @event_emitter.on("off", callback)

  add_event_listener: (event_name) ->
    switch event_name
      when 'digital_write_on'
        @adaptor.event_emitter.on('digital_write_on', => @event_emitter.emit("on") )
      when 'digital_write_off'
        @adaptor.event_emitter.on('digital_write_off', => @event_emitter.emit("off") )


