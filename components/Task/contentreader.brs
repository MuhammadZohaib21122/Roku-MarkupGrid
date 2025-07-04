sub init()
  m.top.functionName = "getcontent"
end sub

sub getcontent()
  xfer = CreateObject("roURLTransfer")
  xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
  xfer.SetURL("https://devtest-storage.b-cdn.net/Roku/sample%20json%20files/gridSample.json")
  rsp = xfer.GetToString()
  json = ParseJson(rsp)
  

  if json <> invalid and json.Count() > 0 then
    ?"JSON Data Retrieved Successfully"


    parentContentNode = CreateObject("RoSGNode", "ContentNode")

    for each item in json
      if item <> invalid then
       
        itemNode = parentContentNode.CreateChild("ItemData")

       
        if item.DoesExist("mediaId") then itemNode.mediaId = item.mediaId
        if item.DoesExist("videoTitle") then itemNode.videoTitle = item.videoTitle
        if item.DoesExist("imagePath") then itemNode.imagePath = item.imagePath
        if item.DoesExist("videoPath") then itemNode.videoPath = item.videoPath
        if item.DoesExist("bgImagePath") then itemNode.bgImagePath = item.bgImagePath
      
        
        ' ?"Added Item: "; itemNode.title
        ?"ID               ."item.mediaId
        ?"Title            ."item.videoTitle
        ?"Image Path        ."item.imagePath
        ?"Video Path        ."item.videoPath
        ?"bgImagePath       ."item.bgImagePath

      end if
    next

    ?"Total Items Added: ";  parentContentNode.GetChildCount()
  else
    ?"Invalid or Empty JSON"
  end if
  m.top.content = parentContentNode
end sub











' sub getcontent()
'   xfer = CreateObject("roURLTransfer")
'   xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
'   xfer.SetURL("https://devtest-storage.b-cdn.net/Roku/sample%20json%20files/gridSample.json")
'   rsp = xfer.GetToString()
'   json = ParseJson(rsp)


'   if json <> invalid and json.Count() > 0 then
'     ?"JSON Data:"
'     for each item in json
'       ?"Index: "; item
'     next
'   else
'     ?"Invalid or Empty JSON"
'   end if

'   parentContentNode = CreateObject("RoSGNode", "ContentNode")
'   item = parentContentNode.CreateChild("ItemData")
' ?"item >>>>>>"item
' end sub

