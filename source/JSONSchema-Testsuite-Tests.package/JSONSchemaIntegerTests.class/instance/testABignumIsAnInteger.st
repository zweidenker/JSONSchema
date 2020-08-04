tests
testABignumIsAnInteger
	self
		assertValid: '12345678910111213141516171819202122232425262728293031'
		description: 'a bignum is an integer'