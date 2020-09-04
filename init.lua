-- Define hyper key
hyper = {"cmd", "alt", "ctrl"}

-- Load spoons
hs.loadSpoon("Caffeine")

-- load individual scripts
require("muteIfEduroam")
require("modes")
require("screenLock")

-- Move audio control to separat script, library like.
