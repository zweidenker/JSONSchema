tests
testAnInvalidRelativeIRIReference
	self
		assertInvalid: '"/abc"'
		description: 'an invalid relative IRI Reference'