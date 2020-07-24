tests
testItemsInRange
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 1;
		maxItems: 10.
	self
		shouldnt: [ constraint validate: #(1 2 3 4 5) ]
		raise: JSONConstraintError