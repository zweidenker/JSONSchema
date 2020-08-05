tests
testFewerItemsIsValid
	self
		assertValid: '[[{"foo":null}],[{"foo":null}]]'
		description: 'fewer items is valid'