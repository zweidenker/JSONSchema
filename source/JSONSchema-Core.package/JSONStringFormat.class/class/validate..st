services
validate: aString 
	aString isString ifFalse: [ 
		JSONTypeError
			signal: aString printString , ' is not a string' ]
	