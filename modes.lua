-- Thore Petersen
-- 01.09.2020

-- Define "modes of operation", depending on the environment. Toggle modes with
-- hyper-key-combo plus some letter.

-- Office mode
hs.loadSpoon("Caffeine")

function office()
    hs.alert.show("Office mode")

    -- Prevent sleep
    spoon.Caffeine:start()
    spoon.Caffeine:setState(true)

    -- Mute speakers, if internal
    if audioIsInternal() then
        hs.audiodevice.defaultOutputDevice():setMuted(true)
    end

    os.execute("sh mac-dnd.sh 1")
end

hs.hotkey.bind(hyper, "O", office)

-- Home mode
function home()
    hs.alert.show("Home mode")
    
    -- Stop Caffeine
    spoon.Caffeine:stop()
    
    -- Unmute speakers
    hs.audiodevice.defaultOutputDevice():setMuted(false)
    
    os.execute("sh mac-dnd.sh 0")
end

hs.hotkey.bind(hyper, "H", home)


-- Out mode
function out()
    hs.alert.show("Out mode")
    
    -- Stop Caffeine
    spoon.Caffeine:stop()
    
    -- Unmute speakers
    if audioIsInternal() then
        hs.audiodevice.defaultOutputDevice():setMuted(true)
    end
    
    os.execute("sh mac-dnd.sh 0")
end

hs.hotkey.bind(hyper, "U", out)
