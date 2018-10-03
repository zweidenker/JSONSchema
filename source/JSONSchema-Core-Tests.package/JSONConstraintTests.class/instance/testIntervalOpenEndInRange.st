tests
testIntervalOpenEndInRange
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0.
	self 
		shouldnt: [ constraint validate: 5 ]
		raise: JSONConstraintError 