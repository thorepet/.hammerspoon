-- Thore Petersen
-- 04.09.2020

-- Stop Caffeine when the screen is locked, and restart it when it is unlocked.
-- Caffeine:stop() preserves the internal state, such that Caffeine:start() is
-- automatically set to the state before the screen was locked.

function caffCallback(event)
    if event == hs.caffeinate.watcher.screensDidLock then
        spoon.Caffeine:stop()
    elseif event == hs.caffeinate.watcher.screensDidUnlock then
        spoon.Caffeine:start()
    end

end

caffWatcher = hs.caffeinate.watcher.new(caffCallback)
caffWatcher:start()
