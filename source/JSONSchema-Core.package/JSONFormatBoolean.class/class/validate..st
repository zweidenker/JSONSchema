services
validate: anObject
	(anObject = true | anObject = false)
		ifFalse: [ JSONTypeError signal: anObject asString , ' should be a boolean' ]