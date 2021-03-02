-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
wibox = require("wibox")

-- Theme handling library
beautiful = require("beautiful")

-- Notification library
naughty = require("naughty")

-- Declarative object management
ruled = require("ruled")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Set the config_dir variable to point to... the config directory
config_dir = awful.util.getdir("config")

-- Add a function to streamline loading files from rc.d
function loadrc (c)
    dofile(config_dir.."rc.d/"..c)
end
