tests
testAnInvalidRelativeURIReference
	self
		assertInvalid: '"/abc"'
		description: 'an invalid relative URI Reference'