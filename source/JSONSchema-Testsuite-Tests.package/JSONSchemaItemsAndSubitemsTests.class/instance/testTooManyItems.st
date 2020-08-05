tests
testTooManyItems
	self
		assertInvalid:
			'[[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'too many items'