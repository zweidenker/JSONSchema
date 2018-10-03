tests
testIntervalInRangeAtEnd
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		shouldnt: [ constraint validate: 10 ]
		raise: JSONConstraintError 