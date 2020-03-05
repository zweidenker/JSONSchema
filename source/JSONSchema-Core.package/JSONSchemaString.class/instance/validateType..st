validating
validateType: aString 
	aString isString ifFalse: [ 
		JSONTypeError signal: aString asString, ' is not a string ' ]