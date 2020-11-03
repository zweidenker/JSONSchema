services
validateString: aString
	^ (aString = 'true' | aString = 'false')
		ifFalse: [ JSONTypeError signal: aString asString , ' should be a boolean' ]