tests
testAFloatWithZeroFractionalPartIsANumberAndAnInteger
	self
		assertValid: '1.0'
		description: 'a float with zero fractional part is a number (and an integer)'