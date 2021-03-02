--------------------------------------------------------------------
--                     Awesome WM config file                     --
--------------------------------------------------------------------

-- Load the required librarys
local awful = require("awful")
dofile(awful.util.getdir("config") .. "rc.d/lib.lua")

-- Define some variables
terminal = os.getenv("TERMINAL") or "termite"
browser = os.getenv("BROWSER") or "firefox"
filemanager = os.getenv("FILEMANAGER") or "pcmanfm"
launcher = os.getenv("LAUNCHER") or "dmenu_run"
editor = os.getenv("EDITOR") or "micro"
theme = os.getenv("THEME") or "nordic"

-- Error handling
loadrc("error-handling.lua")

-- Variable definitions
loadrc("variables.lua")

-- Tag
loadrc("tag.lua")

-- Wibar
loadrc("wibar.lua")

-- Mouse bindings
loadrc("mouse-bindings.lua")

-- Key bindings
loadrc("key-bindings.lua")

-- Rules
loadrc("rules.lua")

-- Titlebars
loadrc("titlebars.lua")

-- Notifications
loadrc("notifications.lua")

-- Powerline theme
dofile("/usr/share/powerline/bindings/awesome/powerline.lua")

--------------------------------------------------------------------
--                           Other stuff                          --
--------------------------------------------------------------------

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

-- Autostart script
awful.spawn.with_shell(config_dir.."autostart")

-- GNOME-flashback desktop
awful.spawn("gnome-flashback", {
  sticky = true,
  below  = true,
  border_width = 0,
})
