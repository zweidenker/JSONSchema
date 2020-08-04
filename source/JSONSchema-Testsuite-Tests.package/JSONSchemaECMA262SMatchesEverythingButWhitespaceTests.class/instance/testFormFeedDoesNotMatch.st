tests
testFormFeedDoesNotMatch
	self assertInvalid: '"\f"' description: 'Form feed does not match'