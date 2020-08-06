tests
testComparisonWorksForHighNumbers
	self
		assertValid: '18446744073709551600'
		description: 'comparison works for high numbers'