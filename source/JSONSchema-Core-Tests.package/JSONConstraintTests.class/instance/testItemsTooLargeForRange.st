tests
testItemsTooLargeForRange
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 1;
		maxItems: 10.
	self 
		should: [ constraint validate: #(1 2 3 4 5 6 7 8 9 10 11) ]
		raise: JSONConstraintError 