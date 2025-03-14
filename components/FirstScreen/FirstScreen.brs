sub init()
  ' m.top.setFocus(true)

  m.ExitGroup = m.top.FindNode("ExitGroup")
  m.exitAppButton = m.top.findNode("exitButton")
  m.cancelExitDialogeButton = m.top.findNode("cancelExitButton")
  m.exitAppButton.observeField("buttonSelected", "exitButtonSelect")
  m.cancelExitDialogeButton.observeField("buttonSelected", "cancelExitDialoge")

  m.backbtn = m.top.findNode("backbtn")
  m.backbtn.observeField("buttonSelected", "backbtn")

  m.markupgrid = m.top.findNode("exampleMarkupGrid")
  m.markupgrid.observeField("ItemSelected", "gotovideoscreen")

  m.markupgrid.observeField("ItemFocused", "OnItemFocused")

  m.readMarkupGridTask = createObject("roSGNode", "ContentReader")
  m.readMarkupGridTask.observeField("content", "showmarkupgrid")
  m.readMarkupGridTask.control = "RUN"
  m.markupgrid.setFocus(true)
  m.currentIndex = 0
  m.top.ObserveField("visible", "OnVisibleChange")

  m.videoPlayer = m.top.findNode("videoPlayer")
  m.top.observeField("item", "playVideo")
  m.lastLoggedSecond = 0
  m.backbtn.visible = false
end sub

function backbtn()
  m.markupgrid.visible = false
  m.backbtn.visible = false
  m.videoPlayer.setFocus(true)
end function

function playVideo()
  if m.top.item <> invalid
    ?"Playing Video: "; m.top.item.videoPath


    m.video = createObject("roSGNode", "ContentNode")
    m.video.url = m.top.item.videoPath
    m.video.streamFormat = "hls"

    m.videoPlayer.content = m.video
    m.videoPlayer.control = "play"


    m.videoPlayer.observeField("duration", "onVideoDuration")
    m.videoPlayer.observeField("state", "onVideoStateChange")
    m.videoPlayer.observeField("position", "onVideoPositionChange")

    errorMessage()
    m.videoPlayer.setFocus(true)
  else
    ?"Error: item is invalid."
  end if
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

sub OnItemFocused()
  focusedIndex = m.markupgrid.itemFocused
  ?"Focused Item Index: "; focusedIndex
  m.currentIndex = focusedIndex

end sub


function getMarkupGridItemCount() as integer
  if m.markupgrid.content <> invalid then
    return m.markupgrid.content.getChildCount()
  else
    return 0
  end if

end function

function gotovideoscreen()
  ?"gotovideoscreen called"

  focusedIndex = m.markupgrid.itemFocused
  ?"Focused Index: "; focusedIndex

  if m.markupgrid.content = invalid
    ?"Error: MarkupGrid content is invalid."

  end if

  if focusedIndex < 0 or focusedIndex >= m.markupgrid.content.getChildCount()
    ?"Error: Focused index out of bounds."

  end if

  selectedItem = m.markupgrid.content.getChild(focusedIndex)

  if selectedItem = invalid
    ?"Error: Selected item is invalid."

  end if

  ?"Selected Item Data:"
  ?"ID: "; selectedItem.mediaId
  ?"Title: "; selectedItem.videoTitle
  ?"Video Path: "; selectedItem.videoPath


  m.top.item = selectedItem

  m.videoPlayer.visible = true
  m.markupgrid.visible = false
  ?"Video screen opened."
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

      ' if m.ExitGroup.visible = false

      '   m.ExitGroup.visible = true
      '   m.cancelExitDialogeButton.setFocus(true)

      '   handled = true

      ' else if m.ExitGroup.visible = true

      '   m.ExitGroup.visible = false

      '   m.markupgrid.setFocus(true)

      '   handled = true

      ' else
      if m.videoPlayer.visible = true
        ' m.videoPlayer.control = "stop"
        m.backbtn.visible = true
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
        m.markupgrid.setFocus(true)

      end if
    end if

    if key = "left"

      if m.exitAppButton.hasFocus()

        m.exitAppButton.setFocus(false)
        m.cancelExitDialogeButton.setFocus(true)

        handled = true

      else if m.videoPlayer.visible = true and m.markupgrid.visible = true and m.currentIndex = 0

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
      end if
    end if

  end if
  return handled

end function

' function onKeyEvent(key as string, press as boolean) as boolean
'   handled = false

'   if press
'     if key = "down"
'       if m.markupgrid.hasFocus()
'         totalItems = getMarkupGridItemCount()
'         numRows = m.markupgrid.numRows

'         if numRows > 1
'           numCols = totalItems / numRows
'           secondLastRowStartIndex = (numRows - 2) * numCols
'           lastRowStartIndex = (numRows - 1) * numCols

'           secondLastRowItems = totalItems - secondLastRowStartIndex
'           lastRowItems = totalItems - lastRowStartIndex

'           if lastRowItems < secondLastRowItems
'             if m.currentIndex >= secondLastRowStartIndex + (lastRowItems - 1)
'               m.markupgrid.jumpToItem = totalItems - 1
'               handled = true
'             end if
'           end if
'         end if
'       end if
'     end if
'   end if

'   return handled
' end function