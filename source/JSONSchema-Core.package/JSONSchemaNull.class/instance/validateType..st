validation
validateType: anObject 
	anObject isNil ifFalse: [ 
		JSONTypeError signal: anObject printString, ' is not null ' ]