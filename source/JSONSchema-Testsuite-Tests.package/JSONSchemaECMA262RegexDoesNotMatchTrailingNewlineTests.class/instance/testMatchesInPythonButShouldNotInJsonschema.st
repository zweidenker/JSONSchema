tests
testMatchesInPythonButShouldNotInJsonschema
	self
		assertInvalid: '"abc\n"'
		description: 'matches in Python, but should not in jsonschema'