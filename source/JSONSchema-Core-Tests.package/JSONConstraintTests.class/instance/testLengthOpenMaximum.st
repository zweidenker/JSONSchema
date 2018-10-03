tests
testLengthOpenMaximum
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 5.
	self 
		shouldnt: [ constraint validate: 'hello world' ]
		raise: JSONConstraintError 