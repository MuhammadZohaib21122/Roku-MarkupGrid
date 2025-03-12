sub init()


    m.videoPlayer = m.top.findNode("videoPlayer")
    m.videoPlayer.setFocus(true)

end sub

function onKeyEvent(key as string, press as boolean) as boolean

    handled = false

    if press

        if key = "back"

            if m.videoPlayer.visible = true

                m.top.getScene().callFunc("CloseScreen", invalid)

                handled = true

            end if
        end if


        handled = true
    end if

    return handled
end function