-- Thore Petersen
-- 01.09.2020

-- Define "modes of operation", depending on the environment. Toggle modes with
-- hyper-key-combo plus some letter.

-- Office mode
function office()
    hs.alert.show("A720 is the best")

    -- Prevent sleep
    hs.caffeinate.set("displayIdle", true)
    
    -- Mute speakers, if internal
    if audioIsInternal() then
        hs.audiodevice.defaultOutputDevice():setMuted(true)
    end
    
    -- Execute script to enable Do Not Disturb.
    os.execute("sh macos-toggle-dnd.sh --enable")
end

hs.hotkey.bind(hyper, "O", office)

-- Home mode
function home()
    hs.alert.show("Home sweet home")
    
    -- Allow display sleep
    hs.caffeinate.set("displayIdle", false)
    
    -- Unmute speakers
    hs.audiodevice.defaultOutputDevice():setMuted(false)
    
    -- Execute script to disable Do Not Disturb.
    os.execute("sh macos-toggle-dnd.sh --disable")
end

hs.hotkey.bind(hyper, "H", home)


-- Out mode
function out()
    hs.alert.show("Whereever...")
    
    -- Allow display sleep
    hs.caffeinate.set("displayIdle", false)
    
    -- Mute speakers
    if audioIsInternal() then
        hs.audiodevice.defaultOutputDevice():setMuted(true)
    end

    -- Execute script to disable Do Not Disturb.
    os.execute("sh macos-toggle-dnd.sh --disable")
end

hs.hotkey.bind(hyper, "U", out)
