tests
testOneSupplementaryUnicodeCodePointIsNotLongEnough
	self
		assertInvalid: '"💩"'
		description: 'one supplementary Unicode code point is not long enough'