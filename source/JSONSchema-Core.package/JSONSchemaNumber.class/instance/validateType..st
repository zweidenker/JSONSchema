validation
validateType: anObject
	(anObject isKindOf: Number) ifFalse: [ 
		JSONTypeError signal: anObject asString, ' is not a number ' ]
	