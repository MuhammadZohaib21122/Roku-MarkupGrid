sub init()
  m.top.id = "markupgriditem"
  m.itemposter = m.top.findNode("itemPoster")
  m.itemmask = m.top.findNode("itemMask")
  m.videoTitle = m.top.findNode("videoTitle")
  m.focuslabel = m.top.findNode("focusLabel")
end sub


sub showcontent()

  itemcontent = m.top.itemContent
  m.itemposter.uri = itemcontent.imagePath
  m.videoTitle.text = itemcontent.videoTitle
end sub


sub showfocus()

  ' scale = 1 + (m.top.focusPercent * 0.08)
  ' m.itemposter.scale = [scale, scale]
  m.itemmask.opacity = 0.75 - (m.top.focusPercent * 0.75)
 
end sub














' sub init()
'   m.top.id = "markupgriditem"
'   m.itemposter = m.top.findNode("itemPoster")
'   m.itemmask = m.top.findNode("itemMask")
'   m.videoTitle = m.top.findNode("videoTitle")
'   m.focuslabel = m.top.findNode("focusLabel")
' end sub

' sub showcontent()
'   itemcontent = m.top.itemContent
'   if itemcontent <> invalid then
'       if itemcontent.DoesExist("imagePath") then
'           m.itemposter.uri = itemcontent.imagePath
'       end if

'       if itemcontent.DoesExist("videoTitle") then
'           m.videoTitle.text = itemcontent.videoTitle
'       end if
'   end if
' end sub

' sub showfocus()
'   scale = 1 + (m.top.focusPercent * 0.08)
'   m.itemposter.scale = [scale, scale]
'   m.itemmask.opacity = 0.75 - (m.top.focusPercent * 0.75)
'   m.videoTitle.opacity = m.top.rowFocusPercent
' end sub

