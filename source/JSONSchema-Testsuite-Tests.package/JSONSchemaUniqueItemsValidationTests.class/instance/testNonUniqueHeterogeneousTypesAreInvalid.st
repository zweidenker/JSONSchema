tests
testNonUniqueHeterogeneousTypesAreInvalid
	self
		assertInvalid: '[{},[1],true,null,{},1]'
		description: 'non-unique heterogeneous types are invalid'