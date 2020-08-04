tests
testJavaScriptPseudoArrayIsValid
	self
		assertValid: '{"0":"invalid","length":1}'
		description: 'JavaScript pseudo-array is valid'