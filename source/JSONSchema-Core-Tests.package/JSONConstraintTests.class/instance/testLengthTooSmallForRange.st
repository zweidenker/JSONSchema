tests
testLengthTooSmallForRange
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 1;
		maxLength: 10.
	self 
		should: [ constraint validate: '' ]
		raise: JSONConstraintError 