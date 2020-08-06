tests
testAnInvalidURIThoughValidURIReference
	self
		assertInvalid: '"abc"'
		description: 'an invalid URI though valid URI reference'