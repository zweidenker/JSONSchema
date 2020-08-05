tests
testWrongItem
	self
		assertInvalid:
			'[{"foo":null},[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'wrong item'