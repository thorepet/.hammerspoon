-- Thore Petersen
-- 30.09.20

-- This function moves the currently focused window to the second screen in my
-- office, and toggles fullscreen. This functionality is bound to the hyper+F
-- hotkey.

function win_office_fullscreen()

    -- Find my office screen. Returns hs.screen object, or nil.
    function office_screen()
        UUID = "1AE2449E-4F45-5E50-AEA5-2629374967EE"
        return hs.screen.find(UUID)
    end
    
    screen = office_screen()
    
    -- If screen is not nil, move the currently focussed window to it, and make
    -- it full screen.
    if screen then
        win = hs.window.focusedWindow()

        -- Exit fullscreen, otherwise hs.window:moveToScreen() does not work.
        win:setFullScreen(false)

        win:moveToScreen(screen)
        win:setFullScreen(true)
    end
end

hs.hotkey.bind(hyper, "F", win_office_fullscreen)
