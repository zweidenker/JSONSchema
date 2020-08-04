tests
testBooleanSchemaTrueInIfAlwaysChoosesTheThenPathInvalid
	self
		assertInvalid: '"else"'
		description: 'boolean schema true in if always chooses the then path (invalid)'