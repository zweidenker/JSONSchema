tests
testNonRecognizedMembersAreIgnored
	self
		assertValid: '{"answer 1":"42"}'
		description: 'non recognized members are ignored'