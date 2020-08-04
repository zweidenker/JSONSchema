tests
testFloatMinusOneIsInvalid
	self
		assertInvalid: '9.007199254740991e15'
		description: 'float minus one is invalid'