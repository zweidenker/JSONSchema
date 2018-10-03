tests
testIntervalTooSmallForRange
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		should: [ constraint validate: -1 ]
		raise: JSONConstraintError 