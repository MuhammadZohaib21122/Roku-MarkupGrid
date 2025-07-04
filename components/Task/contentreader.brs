sub init()
  m.top.functionName = "getcontent"
end sub

sub getcontent()
  ' xfer = CreateObject("roURLTransfer")
  ' xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
  ' xfer.SetURL("https://devtest-storage.b-cdn.net/Roku/sample%20json%20files/gridSample.json")
  ' rsp = xfer.GetToString()
  ' json = ParseJson(rsp)
  json = [
    {
        "mediaId": "201",
        "type": "video",
        "is4k": "false",
        "videoTitle": "S-1_E1",
        "imagePath": "pkg:/images/20.jpg",
        "bgImagePath": "pkg:/images/full-20.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/029.mp3",
        
        "videoPath": "pkg:/videos/s1/S1-E1.mp4",
       
    },
    {
        "mediaId": "202",
        "type": "video",
        "is4k": "false",
        "videoTitle": "Winter Stories",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/016.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/016.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/031.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/032.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/13ada7b9-12f8-476e-9d2e-ae4a0a614794/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/9483c119-3215-4f9a-8c0f-7f270f3d6b73/playlist.m3u8"
    },
    {
        "mediaId": "203",
        "type": "video",
        "is4k": "true",
        "videoTitle": "River Fireplace Evenings",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/017.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/017.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/033.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/034.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/41cc133f-fb88-4628-ac29-84721c0170b9/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/e748f335-2fa5-4033-b43a-493384a3c460/playlist.m3u8"
    },
    {
        "mediaId": "204",
        "type": "video",
        "is4k": "true",
        "videoTitle": "Rising Flames",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/018.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/018.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/035.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/036.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/926b3f59-2f8a-4f26-af29-0626c82b82e2/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/12cc8165-32fe-4390-b879-84b079f712bd/playlist.m3u8"
    },
    {
        "mediaId": "205",
        "type": "video",
        "is4k": "false",
        "videoTitle": "Love at Forest",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/019.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/019.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/037.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/038.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/639ecc29-1dd9-4a0a-87ab-f29f2ac0be2a/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/4251038e-0126-4088-89fc-1974981f59a3/playlist.m3u8"
    },
    {
        "mediaId": "206",
        "type": "video",
        "is4k": "false",
        "videoTitle": "Riverside Meditation",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/020.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/020.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/039.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/040.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/61565b57-a9fd-4251-8486-c6da310f4d88/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/f272581f-1193-42c8-a217-150ec63bc91a/playlist.m3u8"
    },
    {
        "mediaId": "207",
        "type": "video",
        "is4k": "true",
        "videoTitle": "Casual Bonfire",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/021.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/021.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/041.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/042.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/df435183-d8b3-4be4-b686-9cf846100967/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/7b16e694-a5ad-4087-b7a8-f340d6bb168d/playlist.m3u8"
    },
    {
        "mediaId": "208",
        "type": "video",
        "is4k": "true",
        "videoTitle": "Starry Night Bonfire",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/022.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/022.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/043.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/044.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/3100c8e8-71b0-4aa8-a07c-5f9fd6bbe0a7/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/98454273-734f-4f16-88ad-31635e3e162e/playlist.m3u8"
    },
    {
        "mediaId": "209",
        "type": "video",
        "is4k": "false",
        "videoTitle": "Bonfire Nights",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/023.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/023.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/045.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/046.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/24276b72-ca0b-4f78-9290-4b2674a83986/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/8ff1556f-c177-4b7b-b7a0-1770396df15e/playlist.m3u8"
    },
    {
        "mediaId": "210",
        "type": "video",
        "is4k": "true",
        "videoTitle": "Wild Ambience",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/024.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/024.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/047.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/048.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/ee31559d-cbee-4039-833e-05cc9680ad75/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/65de427c-a704-4dc9-8bba-5d83e1514ae4/playlist.m3u8"
    },
    {
        "mediaId": "211",
        "type": "video",
        "is4k": "true",
        "videoTitle": "Spiritual Therapy",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/025.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/025.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/049.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/050.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/7177f12f-0526-4f6e-a58c-d43a12666fa0/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/6299ce23-672f-42f3-8b3f-b2731ecc917a/playlist.m3u8"
    },
    {
        "mediaId": "212",
        "type": "video",
        "is4k": "false",
        "videoTitle": "Sleepful",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/026.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/026.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/051.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/052.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/f328d5a7-2d10-4ba6-84f3-ab0e38813c5f/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/cc8d587b-3b76-48aa-938f-f697769f82eb/playlist.m3u8"
    },
    {
        "mediaId": "213",
        "type": "video",
        "is4k": "true",
        "videoTitle": "Forest Fire",
        "imagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/Thumbnails/027.jpg",
        "bgImagePath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Collection/Fireplace%20Collection/BGImages/027.jpg",
        "audioPath": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/053.mp3",
        "noMusicAudio": "https://screensaverapps.b-cdn.net/VoD%20Apps%20-%20Roku%20Tv/Fireplace%20Collection/Music/054.mp3",
        "videoPath": "https://vz-25df0632-0a6.b-cdn.net/5d946e13-f7d6-461f-841e-d8326275c794/playlist.m3u8",
        "noMusicVideo": "https://vz-25df0632-0a6.b-cdn.net/fa74bc49-89e0-4441-ab23-c3afed2582d8/playlist.m3u8"
    }
]

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

