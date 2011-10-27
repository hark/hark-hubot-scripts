module.exports = (robot) ->
  robot.respond /(weather)( in)? (.*)/i, (msg) ->
    weatherMe msg, msg.match[3], (url) ->
      msg.send url

weatherMe = (msg, query, cb) ->
  msg.http('http://www.google.com/ig/api')
    .query(weather: query)
    .get() (err, res, body) ->
      if match = body.match(/<current_conditions>(.+?)<\/current_conditions>/)
        icon = match[1].match(/<icon data="(.+?)"/)
        degrees = match[1].match(/<temp_f data="(.+?)"/)
        cb "#{degrees[1]}° — http://www.google.com#{icon[1]}"
      else
        cb "Sorry, no weather results for '#{query}'"
