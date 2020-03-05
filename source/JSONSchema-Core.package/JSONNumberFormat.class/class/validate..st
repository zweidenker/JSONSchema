services
validate: anObject
	anObject isNumber ifFalse: [ 
		JSONTypeError signal: anObject asString, ' should be a number' ]