-- Thore Petersen
-- 30.09.20

-- Function to move the focussed window to my second screen and toggle full
-- screen mode.
function window_fullscreen2()
    -- Potentially overcomplicated, but works for now.
    
    -- Check if the second screen is "my" office screen. If so, return the
    -- hs.screen object. If not return nil.
    function office_screen()

        -- Return bool of the function's argument being "my" office screen.
        function is_office_screen(screen)
            UUID = "1AE2449E-4F45-5E50-AEA5-2629374967EE"
            return screen:getUUID() == UUID
        end
    
        screen = hs.screen.allScreens()[2]
        if is_office_screen(screen) then
            return screen
        else
            return nil
        end
    end

    win = hs.window.focusedWindow()
    screen = office_screen()

    -- If screen is not nil, move the currently focussed window to it, and make
    -- it full screen.
    if screen then
        win:moveToScreen(screen)
        win:setFullScreen(true)
    end
end

hs.hotkey.bind(hyper, "F", window_fullscreen2)
