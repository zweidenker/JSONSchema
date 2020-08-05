tests
testPropertiesDefinedInAllOfAreNotExamined
	self
		assertInvalid: '{"foo":1,"bar":true}'
		description: 'properties defined in allOf are not examined'