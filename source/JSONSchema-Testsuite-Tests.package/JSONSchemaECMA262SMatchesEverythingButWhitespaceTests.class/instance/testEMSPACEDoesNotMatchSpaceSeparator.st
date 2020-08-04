tests
testEMSPACEDoesNotMatchSpaceSeparator
	self
		assertInvalid: '" "'
		description: 'EM SPACE does not match (Space_Separator)'