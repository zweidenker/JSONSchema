tests
testRefValidMaxItemsIgnored
	self
		assertValid: '{"foo":[1,2,3]}'
		description: 'ref valid, maxItems ignored'