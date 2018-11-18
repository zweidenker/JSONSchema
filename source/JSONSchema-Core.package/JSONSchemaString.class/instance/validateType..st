validating
validateType: aString 
	aString isString ifFalse: [ 
		JSONTypeErrror signal: aString asString, ' is not a string ' ]