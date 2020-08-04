tests
testRegexesAreCaseSensitive2
	self
		assertInvalid: '{"a_X_3":3}'
		description: 'regexes are case sensitive, 2'