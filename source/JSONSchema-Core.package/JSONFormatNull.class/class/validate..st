services
validate: anObject
	anObject isNil
		ifFalse: [ JSONTypeError signal: anObject asString , ' should be nil' ]