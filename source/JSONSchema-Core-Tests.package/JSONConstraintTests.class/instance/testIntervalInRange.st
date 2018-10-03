tests
testIntervalInRange
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		shouldnt: [ constraint validate: 5 ]
		raise: JSONConstraintError 