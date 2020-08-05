tests
testNegativePrefix
	self assertInvalid: '"-1/foo/bar"' description: 'negative prefix'