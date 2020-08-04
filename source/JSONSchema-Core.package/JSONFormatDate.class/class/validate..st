services
validate: aDate
	(aDate isKindOf: Date) ifFalse: [ 
		JSONTypeError
			signal: aDate printString , ' is not a date' ]
	