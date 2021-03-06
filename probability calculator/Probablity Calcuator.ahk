#NoEnv
#SingleInstance Ignore
#NoTrayIcon
SetFormat FloatFast, 0.13
MaxStage := [13, 18, 25, 28, 28, 28, 30, 30, 30, 31, 30, 30]
/*
에픽3 레어2 커먼1

라즈베리A 호두B 땅콩C
캐러멜D 애플젤리E 초콜릿칩F
아몬드G 헤이즐넛H 초코캔디I
키위J
*/
ToppingList := [[]
			   ,[]
			   ,[]
			   ,[]

			   ,[]
			   ,[]
			   ,[]
			   ,["","","","","",  "","","","","",  "","","","","",  "","","","","",  "","","","","",  "","","","2C2F3A3G",""]

			   ,[]
			   ,[]
			   ,[]
			   ,["","","","","",  "","","","","",  "","","","","",  "","","","","",  "","","","","",  "2A2H3D3G","2B2F3A3H","2C2I3B3F","",""]]



Gui Add, Text, x10 y13 w80 h14 +Center, 스테이지
Gui Add, Text, x130 y13 w10 h14 +Center, -
Gui Add, Text, x10 y43 w80 h14 +Center, 시행 횟수
Gui Add, Text, x10 y73 w80 h14 +Center vToppingType1, 토핑 1
Gui Add, Text, x10 y103 w80 h14 +Center vToppingType2, 토핑 2
Gui Add, Text, x10 y133 w80 h14 +Center vToppingType3, 토핑 3
Gui Add, Text, x10 y163 w80 h14 +Center vToppingType4, 토핑 4
Gui Add, Text, x230 y73 w110 h14 vToppingChance1, 100.0000000000000`%
Gui Add, Text, x230 y103 w110 h14 vToppingChance2, 100.0000000000000`%
Gui Add, Text, x230 y133 w110 h14 vToppingChance3, 100.0000000000000`%
Gui Add, Text, x230 y163 w110 h14 vToppingChance4, 100.0000000000000`%
Gui Add, Edit, x110 y10 w20 h20 +Number +Center vEpisode gChangeTopping, 1
Gui Add, Edit, x140 y10 w20 h20 +Number +Center vStage gChangeTopping, 1
Gui Add, Edit, x100 y40 w70 h20 +Number +Center vTries, 0
Gui Add, Edit, x100 y70 w70 h20 +Number +Center vTopping1, 0
Gui Add, Edit, x100 y100 w70 h20 +Number +Center vTopping2, 0
Gui Add, Edit, x100 y130 w70 h20 +Number +Center vTopping3, 0
Gui Add, Edit, x100 y160 w70 h20 +Number +Center vTopping4, 0
Gui Add, Button, x180 y10 w20 h20 gStage+, +
Gui Add, Button, x200 y10 w20 h20 gStage-, -
Gui Add, Button, x180 y40 w20 h20 gTries+, +
Gui Add, Button, x200 y40 w20 h20 gTries-, -
Gui Add, Button, x180 y70 w20 h20 gTopping1+, +
Gui Add, Button, x200 y70 w20 h20 gTopping1-, -
Gui Add, Button, x180 y100 w20 h20 gTopping2+, +
Gui Add, Button, x200 y100 w20 h20 gTopping2-, -
Gui Add, Button, x180 y130 w20 h20 gTopping3+, +
Gui Add, Button, x200 y130 w20 h20 gTopping3-, -
Gui Add, Button, x180 y160 w20 h20 gTopping4+, +
Gui Add, Button, x200 y160 w20 h20 gTopping4-, -
Gui Add, Button, x230 y10 w50 h20 gSave, &Save
Gui Add, Button, x290 y10 w50 h20 gLoad, &Load
Gui Add, Button, x230 y40 w110 h20 gCalculate, &Calculate
Gui Show, w350 h190, 토핑 확률 계산기
return



Stage+:
Gui Submit, NoHide
if (Stage = Maxstage[Episode]){
	if (Episode = 12){
		GuiControl Text, Episode, 1
		GuiControl Text, Stage, 1
	}
	Episode++
	GuiControl Text, Episode,% Episode
	GuiControl Text, Stage, 1
}else{
	Stage++
	GuiControl Text, Stage,% Stage
}
;gosub, ChangeTopping
return

Stage-:
Gui Submit, NoHide
if (Stage = 1){
	if (Episode = 1){
		GuiControl Text, Episode, 12
		GuiControl Text, Stage, 30
	}
	Episode--
	GuiControl Text, Episode,% Episode
	GuiControl Text, Stage,% MaxStage[Episode]
}else{
	Stage--
	GuiControl Text, Stage,% Stage
}
;gosub, ChangeTopping
return

ChangeTopping:
Gui Submit, NoHide
Toppings := ToppingList[Episode][Stage]
Rank := {49: "커먼", 50: "레어", 51: "에픽", 65: "라즈베리", 66: "호두", 67: "땅콩", 68: "캐러멜", 69: "애플젤리", 70: "초콜릿칩", 71: "아몬드", 72: "헤이즐넛", 73: "초코캔디", 74: "키위"}
Loop, 4{
	GuiControl, Text, ToppingType%A_Index%,% Rank[NumGet(Toppings, (A_Index-1)*4, "Short")] " " Rank[NumGet(Toppings, (A_Index-1)*4+2, "Short")]
}
return



Tries+:
Gui Submit, NoHide
Tries++
GuiControl Text, Tries,% Tries
return
Tries-:
Gui Submit, NoHide
Tries--
GuiControl Text, Tries,% Tries
return
Topping1+:
Gui Submit, NoHide
Topping1++
GuiControl Text, Topping1,% Topping1
return
Topping1-:
Gui Submit, NoHide
Topping1--
GuiControl Text, Topping1,% Topping1
return
Topping2+:
Gui Submit, NoHide
Topping2++
GuiControl Text, Topping2,% Topping2
return
Topping2-:
Gui Submit, NoHide
Topping2--
GuiControl Text, Topping2,% Topping2
return
Topping3+:
Gui Submit, NoHide
Topping3++
GuiControl Text, Topping3,% Topping3
return
Topping3-:
Gui Submit, NoHide
Topping3--
GuiControl Text, Topping3,% Topping3
return
Topping4+:
Gui Submit, NoHide
Topping4++
GuiControl Text, Topping4,% Topping4
return
Topping4-:
Gui Submit, NoHide
Topping4--
GuiControl Text, Topping4,% Topping4
return



Save:
Gui Submit, NoHide
IniWrite,% Tries, Topping.ini,% Episode "-" Stage, Tries
IniWrite,% Topping1, Topping.ini,% Episode "-" Stage, Topping1
IniWrite,% Topping2, Topping.ini,% Episode "-" Stage, Topping2
IniWrite,% Topping3, Topping.ini,% Episode "-" Stage, Topping3
IniWrite,% Topping4, Topping.ini,% Episode "-" Stage, Topping4
return

Load:
Gui Submit, NoHide
IniRead Tries, Topping.ini,% Episode "-" Stage, Tries
IniRead Topping1, Topping.ini,% Episode "-" Stage, Topping1
IniRead Topping2, Topping.ini,% Episode "-" Stage, Topping2
IniRead Topping3, Topping.ini,% Episode "-" Stage, Topping3
IniRead Topping4, Topping.ini,% Episode "-" Stage, Topping4
GuiControl Text, Tries,% Tries
GuiControl Text, Topping1,% Topping1
GuiControl Text, Topping2,% Topping2
GuiControl Text, Topping3,% Topping3
GuiControl Text, Topping4,% Topping4
return
Calculate:
Gui Submit, NoHide
GuiControl Text, ToppingChance1,% Topping1 / Tries * 100 "%"
GuiControl Text, ToppingChance2,% Topping2 / Tries * 100 "%"
GuiControl Text, ToppingChance3,% Topping3 / Tries * 100 "%"
GuiControl Text, ToppingChance4,% Topping4 / Tries * 100 "%"
return



GuiClose:
ExitApp