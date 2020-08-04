tests
testAFloatWithZeroFractionalPartIsAnInteger
	self
		assertValid: '1.0'
		description: 'a float with zero fractional part is an integer'