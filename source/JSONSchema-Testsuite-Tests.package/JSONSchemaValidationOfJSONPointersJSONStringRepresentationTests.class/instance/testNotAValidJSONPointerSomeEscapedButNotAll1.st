tests
testNotAValidJSONPointerSomeEscapedButNotAll1
	self
		assertInvalid: '"/~0~"'
		description: 'not a valid JSON-pointer (some escaped, but not all) #1'