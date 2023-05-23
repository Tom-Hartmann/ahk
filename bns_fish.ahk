#maxThreadsPerHotkey, 2
setKeyDelay, 50, 50
setMouseDelay, 50
FishingSpot:= "8" ;Key to spam fishing
delay:= "1000" ;delay in miliseconds
banana:=0

$f1::
	banana:=!banana
	
	while (banana=1)
	{
		
		ControlSend, , %FishingSpot%, Blade & Soul
		Sleep, %delay%
	}
return