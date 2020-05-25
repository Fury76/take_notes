local shell = require "/opt/take_notes/lib.shell"
   local args = {
            socket = "unix:/tmp/shell.sock",  --这是第一步的unxi socket
   }
local status, out, err = shell.execute("sh /opt/take_notes/bootstrap.sh", args)  --ls 是想调用的命令,
ngx.header.content_type = "text/plain"
ngx.say("Result:\n" .. out)