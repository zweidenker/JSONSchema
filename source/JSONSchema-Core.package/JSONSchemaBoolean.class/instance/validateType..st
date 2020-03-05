validation
validateType: anObject
	(anObject isKindOf: Boolean) ifFalse: [ 
		JSONTypeError signal: anObject asString, ' is not a boolean ' ]