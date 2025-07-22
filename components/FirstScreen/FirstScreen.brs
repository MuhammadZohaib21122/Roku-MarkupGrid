sub init()
  ' m.top.setFocus(true)
  m.background = m.top.findNode("background")
  m.ExitGroup = m.top.FindNode("ExitGroup")
  m.exitAppButton = m.top.findNode("exitButton")
  m.cancelExitDialogeButton = m.top.findNode("cancelExitButton")
  m.exitAppButton.observeField("buttonSelected", "exitButtonSelect")
  m.cancelExitDialogeButton.observeField("buttonSelected", "cancelExitDialoge")
  m.backbtn = m.top.findNode("backbtn")
  m.backbtn.observeField("buttonSelected", "onBackButtonSelected")
  m.homebtn = m.top.findNode("homebtn")
  m.homebtn.observeField("buttonSelected", "onHomeButtonSelected")
  m.videoTitle = m.top.findNode("videoTitle")
  m.markupgrid = m.top.findNode("videoMarkupGrid")
  m.markupgrid.observeField("ItemSelected", "onItemSelected")

  m.markupgrid.observeField("ItemFocused", "OnItemFocused")

  m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
  m.readMarkupGridTask.observeField("content", "showmarkupgrid")
  m.readMarkupGridTask.control = "RUN"
  m.markupgrid.setFocus(true)
  m.currentIndex = 0
  m.focusedIndex = 0
  m.top.ObserveField("visible", "OnVisibleChange")

  m.videoPlayer = m.top.findNode("videoPlayer")
  m.lastLoggedSecond = 0

end sub

sub OnItemFocused()
  m.focusedIndex = m.markupgrid.itemFocused
  ?"Focused Item Index: "; m.focusedIndex
  m.currentIndex = m.focusedIndex

  if m.currentIndex > -1
    setItemDetails(m.currentIndex)
  end if
end sub

function setItemDetails(index)
  m.selectedItem = m.markupgrid.content.getChild(index)
  ?"selectedItem >>>" m.selectedItem
  m.background.visible = true
  m.background.uri = m.selectedItem.bgImagePath
  m.videoTitle.text = m.selectedItem.videoTitle
  m.videoPath = m.selectedItem.videoPath
  ?"Background Image URL: ", m.selectedItem.bgImagePath
  ?"Title: ", m.selectedItem.videoTitle
  ?"videoPath: ", m.videoPath
end function

function onItemSelected()
  ?"onItemSelected called"
  m.videoPlayer.visible = true
  m.focusedIndex = m.markupgrid.itemFocused
  ?"Focused Index: ", m.focusedIndex

  setItemDetails(m.focusedIndex)
  m.homebtn.visible = false
  m.backbtn.visible = false
  m.markupgrid.visible = false
  m.background.visible = false
  playVideo()
  ?"Video screen opened."
end function

function playVideo()
  ?"Playing Video: ", m.videoPath

  if m.videoPlayer = invalid
    m.videoPlayer = createObject("roSGNode", "Video")
    m.top.appendChild(m.videoPlayer) 
  end if

  contentNode = createObject("roSGNode", "ContentNode")
  contentNode.url = m.videoPath
  contentNode.streamFormat = "hls"

  m.videoPlayer.content = contentNode
  m.videoPlayer.visible = true 
  m.videoPlayer.control = "play"

  m.videoPlayer.observeField("duration", "onVideoDuration")
  m.videoPlayer.observeField("state", "onVideoStateChange")
  m.videoPlayer.observeField("position", "onVideoPositionChange")

  errorMessage()
  m.videoPlayer.setFocus(true)
end function

sub onVideoDuration(event as object)

  m.duration = event.getData()
  ?"Video Duration: "m.duration

end sub
sub onVideoPositionChange(event as object)

  position = event.getData()
  position = int(position)
  if position <= m.duration

    m.lastLoggedSecond = position

    ?"Video Running seconds: " position
  end if
end sub
sub errorMessage()

  ?"errorCode => " m.videoPlayer.errorCode
  ?"errorMsg => " m.videoPlayer.errorMsg
  ?"errorStr => " m.videoPlayer.errorStr
  ?"errorInfo => " m.videoPlayer.errorInfo

end sub

sub onVideoStateChange(event as object)
  state = event.getData()
  ?"Video State: " state


  if state = "finished"
    ?"Restarting video..."
    m.videoPlayer.control = "stop"
    m.videoPlayer.control = "play"
  end if
end sub

sub showmarkupgrid()
  if m.readMarkupGridTask.content <> invalid and m.readMarkupGridTask.content.getChildCount() > 0
    m.markupgrid.content = m.readMarkupGridTask.content
    ?"Total items in MarkupGrid: "; getMarkupGridItemCount()
  else
    ?"Error: No content available for MarkupGrid."
  end if
end sub

function getMarkupGridItemCount() as integer
  if m.markupgrid.content <> invalid then
    return m.markupgrid.content.getChildCount()
  else
    return 0
  end if

end function

function onHomeButtonSelected()
  m.background.visible = true
  m.markupgrid.visible = true
  m.backbtn.visible = false
  m.homebtn.visible = false
  m.videoPlayer.control = "stop"
  m.videoPlayer.visible = false
  m.markupgrid.setFocus(true)
end function

function onBackButtonSelected()
  m.markupgrid.visible = false
  m.backbtn.visible = false
  m.homebtn.visible = false
  m.videoPlayer.setFocus(true)
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



function onKeyEvent(key as string, press as boolean) as boolean

  handled = false

  if press

    if key = "back"

      if m.videoPlayer.visible = true
        m.backbtn.visible = true
        m.homebtn.visible = true
        m.markupgrid.visible = true
        m.markupgrid.setFocus(true)

        handled = true

      else if m.videoPlayer.visible = false

        m.ExitGroup.visible = true
        m.cancelExitDialogeButton.setFocus(true)

        handled = true

      end if
    end if

    if key = "right"

      if m.cancelExitDialogeButton.hasFocus()

        m.cancelExitDialogeButton.setFocus(false)
        m.exitAppButton.setFocus(true)

        handled = true

      else if m.backbtn.hasFocus()

        m.backbtn.setFocus(false)
        m.homebtn.setFocus(true)
        handled = true

      end if
    end if

    if key = "left"

      if m.exitAppButton.hasFocus()

        m.exitAppButton.setFocus(false)
        m.cancelExitDialogeButton.setFocus(true)
        handled = true

      else if m.homebtn.hasFocus()

        m.homebtn.setFocus(false)
        m.backbtn.setFocus(true)
        handled = true

      end if
    end if

    if key = "up"

      if m.videoPlayer.visible = true and m.markupgrid.visible = true and m.currentIndex < 5

        m.markupgrid.setFocus(false)
        m.backbtn.setFocus(true)

        handled = true


      end if
    end if

    if key = "down"

      m.numberColumns = m.markupgrid.numColumns
      if m.markupgrid.hasFocus()
        if (m.currentIndex < m.markupgrid.content.getChildCount()) and (m.currentIndex mod m.numberColumns >= m.markupgrid.content.getChildCount() mod m.numberColumns)
          m.markupgrid.jumptoItem = m.markupgrid.content.getChildCount() - 1
        end if

      else if m.homebtn.hasFocus() or m.backbtn.hasFocus()

        m.backbtn.setFocus(false)
        m.homebtn.setFocus(false)
        m.markupgrid.setFocus(true)


        handled = true


      end if
    end if

  end if
  return handled

end function
