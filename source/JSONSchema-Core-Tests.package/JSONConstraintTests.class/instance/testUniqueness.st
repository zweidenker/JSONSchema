tests
testUniqueness
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: true.
	self
		shouldnt: [ constraint validate: #(1 2 3 4 5) ]
		raise: JSONConstraintError