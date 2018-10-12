tests
testMulitpleOfIncluded
	self 
		shouldnt: [ (JSONSchema number multipleOf: 2) validate: 16 ] 
		raise: JSONConstraintError 