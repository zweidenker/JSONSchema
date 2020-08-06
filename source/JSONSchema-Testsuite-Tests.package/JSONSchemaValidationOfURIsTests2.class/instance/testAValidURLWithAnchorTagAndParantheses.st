tests
testAValidURLWithAnchorTagAndParantheses
	self
		assertValid: '"http://foo.com/blah_(wikipedia)_blah#cite-1"'
		description: 'a valid URL with anchor tag and parantheses'