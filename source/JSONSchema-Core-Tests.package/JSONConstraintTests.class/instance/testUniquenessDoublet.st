tests
testUniquenessDoublet
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: true.
	self
		should: [ constraint validate: #(1 1 2 3 4 5) ]
		raise: JSONConstraintError