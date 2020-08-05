tests
testBooleanSchemaFalseInIfAlwaysChoosesTheElsePathValid
	self
		assertValid: '"else"'
		description: 'boolean schema false in if always chooses the else path (valid)'