tests
testNoTypeWithConstraints
	| schema |
	schema := JSONSchema fromString: '{"exclusiveMaximum":10}'.

	self 
		should: [ schema validate: 11 ]
		raise: JSONConstraintError.