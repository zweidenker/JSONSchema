tests
testNonUniqueHeterogeneousTypesAreValid
	self
		assertValid: '[{},[1],true,null,{},1]'
		description: 'non-unique heterogeneous types are valid'