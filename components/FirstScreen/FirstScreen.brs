sub init()
  m.top.setFocus(true)

  m.ExitGroup = m.top.FindNode("ExitGroup")
  m.exitAppButton = m.top.findNode("exitButton")
  m.cancelExitDialogeButton = m.top.findNode("cancelExitButton")
  m.exitAppButton.observeField("buttonSelected", "exitButtonSelect")
  m.cancelExitDialogeButton.observeField("buttonSelected", "cancelExitDialoge")

  m.markupgrid = m.top.findNode("exampleMarkupGrid")
  m.markupgrid.observeField("ItemSelected", "gotovideoscreen")

  m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
  m.readMarkupGridTask.observeField("content", "showmarkupgrid")
  m.readMarkupGridTask.control = "RUN"
  m.markupgrid.setFocus(true)
  m.top.ObserveField("visible", "OnVisibleChange")

end sub

sub showmarkupgrid()
  m.markupgrid.content = m.readMarkupGridTask.content
  ?"Total items in MarkupGrid: "; m.markupgrid.content.getChildCount()
end sub


function gotovideoscreen()
  m.top.getScene().callFunc("ShowvideoScreen")
end function

sub OnVisibleChange()

  if m.top.visible = true
    ?"OnVisibleChange"
    m.markupgrid.setFocus(true)
  end if
end sub

function cancelExitDialoge()
  m.ExitGroup.visible = false
  m.markupgrid.setFocus(true)

end function

sub exitButtonSelect()
  m.top.getScene().exitApp = true
end sub

' function getMarkupGridItemCount() as integer
'   if m.markupgrid.content <> invalid then
'     return m.markupgrid.content.getChildCount()
'   else
'     return 0
'   end if



' end function







function onKeyEvent(key as string, press as boolean) as boolean

  handled = false

  if press

    if key = "back"

      if m.ExitGroup.visible = false

        m.ExitGroup.visible = true
        m.cancelExitDialogeButton.setFocus(true)

        handled = true

      else if m.ExitGroup.visible = true

        m.ExitGroup.visible = false
        m.buttons_list.visible = true
        m.buttons_list.setFocus(true)

        handled = true

      end if
    end if

    if key = "right"

      if m.cancelExitDialogeButton.hasFocus()

        m.cancelExitDialogeButton.setFocus(false)
        m.exitAppButton.setFocus(true)

        handled = true

      end if
    end if

    if key = "left"

      if m.exitAppButton.hasFocus()

        m.exitAppButton.setFocus(false)
        m.cancelExitDialogeButton.setFocus(true)

        handled = true

      end if
    end if

  end if
  return handled

end function

