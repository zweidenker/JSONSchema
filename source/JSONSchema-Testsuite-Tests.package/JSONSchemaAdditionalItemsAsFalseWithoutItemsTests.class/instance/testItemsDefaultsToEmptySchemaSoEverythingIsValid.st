tests
testItemsDefaultsToEmptySchemaSoEverythingIsValid
	self
		assertValid: '[1,2,3,4,5]'
		description: 'items defaults to empty schema so everything is valid'