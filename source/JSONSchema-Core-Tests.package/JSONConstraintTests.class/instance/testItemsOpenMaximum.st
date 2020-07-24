tests
testItemsOpenMaximum
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 5.
	self 
		shouldnt: [ constraint validate: #(1 2 3 4 5 6) ]
		raise: JSONConstraintError 