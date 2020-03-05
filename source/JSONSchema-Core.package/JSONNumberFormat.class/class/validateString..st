testing
validateString: aString 
	^ (NumberParser isNumber: aString) ifFalse: [ 
		JSONTypeError signal: aString asString, ' should be a number' ]