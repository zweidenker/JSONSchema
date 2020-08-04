tests
testComparisonWorksForVeryNegativeNumbers
	self
		assertInvalid: '-9.727837981879871e26'
		description: 'comparison works for very negative numbers'