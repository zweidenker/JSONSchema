tests
testEnumIncluded
	| constraint |
	constraint := JSONSchemaEnumConstraint new
		options: #( one two three ).
	self 
		shouldnt: [ constraint validate: 'two' ]
		raise: JSONConstraintError 