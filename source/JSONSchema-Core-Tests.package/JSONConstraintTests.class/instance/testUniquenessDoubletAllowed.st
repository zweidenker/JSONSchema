tests
testUniquenessDoubletAllowed
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: false.
	self
		shouldnt: [ constraint validate: #(1 1 2 3 4 5) ]
		raise: JSONConstraintError