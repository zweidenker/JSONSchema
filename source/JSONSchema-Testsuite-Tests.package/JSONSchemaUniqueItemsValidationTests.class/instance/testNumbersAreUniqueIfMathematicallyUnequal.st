tests
testNumbersAreUniqueIfMathematicallyUnequal
	self
		assertInvalid: '[1.0,1.0,1]'
		description: 'numbers are unique if mathematically unequal'