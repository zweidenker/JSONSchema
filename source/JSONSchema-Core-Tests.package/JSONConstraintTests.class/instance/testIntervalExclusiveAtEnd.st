tests
testIntervalExclusiveAtEnd
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		exclusiveMaximum: 10.
	self 
		should: [ constraint validate: 10 ]
		raise: JSONConstraintError 