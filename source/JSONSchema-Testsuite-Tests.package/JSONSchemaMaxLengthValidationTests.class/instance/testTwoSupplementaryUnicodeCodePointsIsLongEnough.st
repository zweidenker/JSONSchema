tests
testTwoSupplementaryUnicodeCodePointsIsLongEnough
	self
		assertValid: '"💩💩"'
		description: 'two supplementary Unicode code points is long enough'