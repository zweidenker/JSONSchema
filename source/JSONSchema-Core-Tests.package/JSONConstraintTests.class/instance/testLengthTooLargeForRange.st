tests
testLengthTooLargeForRange
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 1;
		maxLength: 10.
	self 
		should: [ constraint validate: 'hello world' ]
		raise: JSONConstraintError 