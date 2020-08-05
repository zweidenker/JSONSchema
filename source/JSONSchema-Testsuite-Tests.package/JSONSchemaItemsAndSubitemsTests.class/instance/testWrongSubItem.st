tests
testWrongSubItem
	self
		assertInvalid:
			'[[{},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'wrong sub-item'