services
validate: anObject
	anObject isNumber ifFalse: [ 
		JSONTypeErrror signal: anObject asString, ' should be a number' ]