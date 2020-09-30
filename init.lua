-- Define hyper key
hyper = {"cmd", "alt", "ctrl"}

-- Define functions
function audioIsInternal()
    -- Determine if the current audio output device is the built-in speaker.
    DEVICE = hs.audiodevice.defaultOutputDevice():name()
    return DEVICE == "Built-in Output"
end

-- Load individual scripts
require("muteIfEduroam")
require("modes")
require("screenLock")
require("officeFullscreen")
