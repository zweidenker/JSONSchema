tests
testLengthInRange
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 1;
		maxLength: 10.
	self 
		shouldnt: [ constraint validate: 'hello' ]
		raise: JSONConstraintError 