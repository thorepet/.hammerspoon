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


-- https://github.com/scottcs/dot_hammerspoon/tree/2495d931782fb485459a254bb62557b93329ac14

-- function appWatchCallback(appName, eventType, appObject)

--     local function hasNoMainWindow() return appObject:mainWindow() == nil end

--     if appName == "Visual Studio Code" then
--         if eventType == hs.application.watcher.launched then
--             hs.timer.waitWhile(
--                 hasNoMainWindow, 
--                 function()
--                     appObject:mainWindow():setFullScreen(true)
--                 end
--             )
--         end
--     end

-- end

-- vsCodeWatcher = hs.application.watcher.new(appWatchCallback)
-- vsCodeWatcher:start()
