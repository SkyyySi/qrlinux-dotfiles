editor_cmd  = terminal .. " -e " .. editor

-- Themes define colours, icons, font and wallpapers.
beautiful.init(awful.util.getdir("config") .. "/themes/" .. theme .. "/theme.lua")

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "Show hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Show the manual", terminal .. " -e man awesome" },
   { "Edit the config", editor_cmd .. " " .. awesome.conffile },
   { "Restart awesome", awesome.restart },
   { "Quit awesome", function() awesome.quit() end },
}

xdg_menu = require("archmenu")

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Anwendungen", xdgmenu },
                                    { "Terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
