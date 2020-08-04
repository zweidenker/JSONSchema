tests
testABignumIsNotAString
	self
		assertInvalid: '98249283749234923498293171823948729348710298301928331'
		description: 'a bignum is not a string'