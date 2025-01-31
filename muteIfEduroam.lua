-- Thore Petersen
-- 01.09.2020

-- Mute the internal speakers when joining eduroam. Set up a watcher for changes
-- to the WiFi SSID, and on every change, check if the SSID is eduroam, and if
-- so, if the default audio output is the internal speakers. If they are, mute
-- them.

-- Determine if the current WiFi SSID is "eduroam"
function ssidIsEduroam()
    SSID = hs.wifi.currentNetwork()
    return SSID == "eduroam"
end

-- Mute speakers if we are on eduroam, and the output device is the internal
-- speakers.
function muteInternalIfEduroam()
    if ssidIsEduroam() then
        if audioIsInternal() then
            hs.audiodevice.defaultOutputDevice():setMuted(true)
        end
    end
end

-- Set up WiFi watcher: Calls the provided function each time the SSID changes.
wifiWatcher = hs.wifi.watcher.new(muteInternalIfEduroam)
wifiWatcher:start()
