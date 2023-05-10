http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
http.Open("POST", "http://127.0.0.1:8000/api/CheckUser")
http.SetRequestHeader("Content-Type", "application/json")

email := "sheraz@gmail.com"
password := "1234"
data := "{""email"":""" . email . """,""password"":""" . password . """}"
http.Send(data)

; Get the response text
responseText := http.ResponseText
; Parse the JSON response
jsonData := JSON.Load(responseText)

; user data

; Check if the response has an error
if (!jsonData.HasKey("error")){
    ; MsgBox, % "Name: " . jsonData["name"]
    username := jsonData["name"]
    useremail := jsonData["email"]
}else if (jsonData.HasKey("error") && jsonData["error"] = "User not found"){
    MsgBox, % jsonData["error"]
    Return
}else if (jsonData.HasKey("error") && jsonData["error"] = "Account already logged in on another device"){
    MsgBox, % jsonData["error"]
    Return
}

MsgBox, % username . "`n" . useremail 