-- Thore Petersen
-- 05.09.2020

-- When the screen is locked, the screen and computer should be allowed to
-- sleep. When the computer is unlocked again, the state before locking should
-- be restored. The function stores the state when the screen is locked, and
-- sets it to false, to allow the screen to sleep. When the computer is
-- unlocked, the previous state is restored.

function caffCallback(event)
    if event == hs.caffeinate.watcher.screensDidLock then
        displayIdleState = hs.caffeinate.get("displayIdle")
        hs.caffeinate.set("displayIdle", false)
    elseif event == hs.caffeinate.watcher.screensDidUnlock then
        hs.caffeinate.set("displayIdle", displayIdleState)
    end

end

caffWatcher = hs.caffeinate.watcher.new(caffCallback)
caffWatcher:start()
