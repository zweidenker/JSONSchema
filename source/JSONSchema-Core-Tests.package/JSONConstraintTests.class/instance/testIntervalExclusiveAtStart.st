tests
testIntervalExclusiveAtStart
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		exclusiveMinimum: 0;
		exclusiveMaximum: 10.
	self 
		should: [ constraint validate: 0 ]
		raise: JSONConstraintError 