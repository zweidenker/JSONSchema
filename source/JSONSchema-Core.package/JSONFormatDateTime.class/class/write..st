writing
write: aDateAndTime 
	"convert to DateaAndTime without the sub-second precision"
	^ aDateAndTime rounded printString