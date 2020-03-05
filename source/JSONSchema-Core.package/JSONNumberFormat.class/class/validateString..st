testing
validateString: aString 
	^ (NumberParser isNumber: aString) ifFalse: [ 
		JSONTypeErrror signal: aString asString, ' should be a number' ]