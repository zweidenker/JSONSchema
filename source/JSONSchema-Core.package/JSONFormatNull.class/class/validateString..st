services
validateString: aString
	^ aString = 'null'
		ifFalse: [ JSONTypeError signal: aString asString , ' should be null' ]