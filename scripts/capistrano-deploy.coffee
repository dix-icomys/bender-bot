# Deploy with capistrano
#
# Commands:
#   bender deploy [branch] to [server] - Deploy branch to server
#   bender list of servers - Show a list of available servers

exec = require('child_process').exec

repos = [
  "firstbuild",
  "oem",
  "qa",
  "staging",
  "test_server",
  "us_test"
]

capistrano_dir = '/home/ubuntu/maketime/current'

module.exports = (robot) ->
  robot.respond /deploy (.+) to (.+)/i, (msg) ->
    if msg.match[2] in repos
 
      console.log "cd #{capistrano_dir} ; cap #{msg.match[2]} deploy branch=#{msg.match[1]}"
      msg.send "In development :("
    else
      msg.send 'I dont know what that is. Try deploying to one of these: ' + repos.join(", ")

  robot.hear /list of servers/i, (msg) ->
    msg.send repos.join(', ')
