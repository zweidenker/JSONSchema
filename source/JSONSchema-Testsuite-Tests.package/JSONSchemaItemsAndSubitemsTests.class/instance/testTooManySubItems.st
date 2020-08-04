tests
testTooManySubItems
	self
		assertInvalid:
			'[[{"foo":null},{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'too many sub-items'