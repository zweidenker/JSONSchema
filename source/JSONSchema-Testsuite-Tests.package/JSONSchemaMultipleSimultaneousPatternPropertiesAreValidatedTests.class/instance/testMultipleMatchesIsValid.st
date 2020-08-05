tests
testMultipleMatchesIsValid
	self
		assertValid: '{"a":21,"aaaa":18}'
		description: 'multiple matches is valid'