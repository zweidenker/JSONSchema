tests
testStringIsInvalid
	self assertInvalid: '{"list":["a"]}' description: 'string is invalid'