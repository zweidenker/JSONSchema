tests
testComparisonWorksForHighNumbers
	self
		assertInvalid: '9.727837981879871e26'
		description: 'comparison works for high numbers'