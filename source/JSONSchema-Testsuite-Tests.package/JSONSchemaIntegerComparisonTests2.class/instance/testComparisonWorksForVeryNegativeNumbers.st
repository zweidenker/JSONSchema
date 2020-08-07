tests
testComparisonWorksForVeryNegativeNumbers
	self
		assertValid: '-18446744073709551600'
		description: 'comparison works for very negative numbers'