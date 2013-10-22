Led = require('../src/drivers/led.coffee')

led =  new Led(17)

led.when_on(-> console.log('LED is on!'))
led.when_off(-> console.log('LED is off!'))

led.turn_on()
led.turn_off()

