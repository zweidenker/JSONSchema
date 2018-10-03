tests
testEnumNotIncluded
	| constraint |
	constraint := JSONSchemaEnumConstraint new
		options: #( one two three ).
	self 
		should: [ constraint validate: 'four' ]
		raise: JSONConstraintError 