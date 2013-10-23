Led = require('../src/drivers/led.coffee')

led =  new Led(17)

led.on('turn_on', -> console.log('LED is on!'))
led.on('turn_off', -> console.log('LED is off!'))

console.log("pin: #{ led.pin }")
console.log("pin: #{ led.is_on }")
console.log("pin: #{ led.is_off }")

led.turn_on()
led.turn_off()

