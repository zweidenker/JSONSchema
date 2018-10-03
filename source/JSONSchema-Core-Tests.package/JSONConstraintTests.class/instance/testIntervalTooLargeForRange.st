tests
testIntervalTooLargeForRange
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		should: [ constraint validate: 100 ]
		raise: JSONConstraintError 