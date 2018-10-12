tests
testMulitpleOfNotIncluded
	self 
		should: [ (JSONSchema number multipleOf: 2) validate: 15 ] 
		raise: JSONConstraintError 