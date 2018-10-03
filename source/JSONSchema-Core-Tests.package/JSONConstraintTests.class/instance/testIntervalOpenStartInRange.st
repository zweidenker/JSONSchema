tests
testIntervalOpenStartInRange
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		maximum: 10.
	self 
		shouldnt: [ constraint validate: -5 ]
		raise: JSONConstraintError 