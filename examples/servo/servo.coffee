Cylon = require '../..'

Cylon.robot
  connection: { name: 'arduino', adaptor: 'firmata', port: '/dev/ttyACM0' }
  device: { name: 'servo', driver: 'servo', pin: 3 }

  work: (my) ->
    angle = 30
    increment = 40

    every 1.seconds(), ->
      angle += increment
      my.servo.angle angle

      console.log "Current Angle: #{my.servo.currentAngle()}"

      increment = -increment if (angle is 30) or (angle is 150)

.start()
