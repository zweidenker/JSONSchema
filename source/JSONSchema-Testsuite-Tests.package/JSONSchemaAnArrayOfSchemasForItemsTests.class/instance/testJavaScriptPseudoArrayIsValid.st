tests
testJavaScriptPseudoArrayIsValid
	self
		assertValid: '{"length":2,"0":"invalid","1":"valid"}'
		description: 'JavaScript pseudo-array is valid'