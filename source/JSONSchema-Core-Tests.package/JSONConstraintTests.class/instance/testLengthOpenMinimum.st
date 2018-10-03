tests
testLengthOpenMinimum
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		maxLength: 10.
	self 
		shouldnt: [ constraint validate: '' ]
		raise: JSONConstraintError 