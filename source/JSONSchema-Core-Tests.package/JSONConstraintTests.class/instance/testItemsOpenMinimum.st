tests
testItemsOpenMinimum
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		maxItems: 10.
	self 
		shouldnt: [ constraint validate: #(1 2 3) ]
		raise: JSONConstraintError 