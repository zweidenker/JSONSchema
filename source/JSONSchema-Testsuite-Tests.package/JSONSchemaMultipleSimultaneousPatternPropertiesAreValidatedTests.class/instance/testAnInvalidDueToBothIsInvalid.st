tests
testAnInvalidDueToBothIsInvalid
	self
		assertInvalid: '{"aaa":"foo","aaaa":31}'
		description: 'an invalid due to both is invalid'