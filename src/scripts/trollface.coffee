module.exports = (robot) ->
  robot.hear /problem\??/i, (msg) ->
    msg.send "http://cl.ly/BG7R/trollface.jpg"
