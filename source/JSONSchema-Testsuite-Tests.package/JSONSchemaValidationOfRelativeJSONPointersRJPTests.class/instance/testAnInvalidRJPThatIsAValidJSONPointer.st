tests
testAnInvalidRJPThatIsAValidJSONPointer
	self
		assertInvalid: '"/foo/bar"'
		description: 'an invalid RJP that is a valid JSON Pointer'