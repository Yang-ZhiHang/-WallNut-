Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "https://ehall.xidian.edu.cn/jwapp/sys/wspjyyapp/*default/index.do"
WScript.Sleep 1000
msgbox "请进入教评待选项界面。",,"指引"
WScript.Sleep 6000

dim have_option, option_num, option_select, have_textarea, textarea_num
Set objArgs = WScript.Arguments
have_option = objArgs(0)
option_num = objArgs(1)
option_select = objArgs(2)
have_textarea = objArgs(3)
textarea_num = objArgs(4)

msgbox "准备好了吗！点击 确定 后点击教评网页任意位置，3秒后脚本将自动运行",,"准备出发啦！预计10秒完工！"

WScript.Sleep 3000


' -----选择题部分-----
dim i

If have_option = 1 Then

For i = 1 To option_num

' 跳转到下一个选项
WshShell.SendKeys "{TAB}"

' 通过上下方向模拟选项的选择
WshShell.SendKeys "{DOWN}" 

Select Case option_select
    Case 1
        WshShell.SendKeys "{UP}"
    Case 3
        WshShell.SendKeys "{DOWN}"
    Case 4
        WshShell.SendKeys "{UP}"
	WshShell.SendKeys "{UP}"
End Select

WScript.Sleep 50 ' 间隔时间

Next

End If


' -----文本框部分-----

If have_textarea = 1 Then

For i = 1 To textarea_num

' 跳转到下一个文本框
WshShell.SendKeys "{TAB}"

' 按下回车键，模拟点击
WshShell.SendKeys "^v" 

WScript.Sleep 50 ' 间隔时间

Next

End If

