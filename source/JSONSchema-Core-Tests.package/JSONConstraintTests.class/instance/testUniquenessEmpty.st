tests
testUniquenessEmpty
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: true.
	self
		shouldnt: [ constraint validate: #() ]
		raise: JSONConstraintError