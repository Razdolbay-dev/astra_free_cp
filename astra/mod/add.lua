defdir = "/etc/astra/lua"
hostname = "astra"
-- load driver
local mysql = require "luasql.mysql"
-- create environment object
env = mysql.mysql()
-- connect to data source
con = env:connect('iptv','root','BULDvat1')
-- reset our table

dofile(string.format(defdir) .. "/channels.ini")

res = con:execute"DROP TABLE channels"

res = con:execute([[
    CREATE TABLE `channels` (
        `channel` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name channel',
        `server` varchar(100) NOT NULL DEFAULT '' COMMENT 'Hostname',
        `input` varchar(150) NOT NULL DEFAULT '' COMMENT 'Input',
        `output` varchar(100) NOT NULL DEFAULT '' COMMENT 'Output',
        `scrambled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Scrambled?',
        `bitrate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'bitrate',
        `cc_error` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'CC-Errors',
        `pes_error` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'PES Errors',
        `ready` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
        UNIQUE KEY `output_server` (`server`,`output`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8
]])

for i, p in pairs (channels) do
  res = assert (con:execute("INSERT INTO `channels` (channel, server, input, output) VALUES ('" .. p.name .. "','" .. hostname .. "','" .. p.input[1] .. "','" .. p.output[1] .."')"))
end

con:close()
env:close()
print("Compite!")