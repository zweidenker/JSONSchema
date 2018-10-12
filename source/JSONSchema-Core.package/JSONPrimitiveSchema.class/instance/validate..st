validation
validate: anObject
	super validate: anObject.
	format ifNotNil: [ 
		format validate: anObject ]
	