tests
testItemsTooSmallForRange
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 1;
		maxItems: 10.
	self 
		should: [ constraint validate: #() ]
		raise: JSONConstraintError 