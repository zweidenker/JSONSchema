testing
validateString: aString 
	^ (NumberParser isValidNumber: aString) ifFalse: [ 
		JSONTypeErrror signal: aString asString, ' should be a number' ]