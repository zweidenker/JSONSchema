tests
testUniqueHeterogeneousTypesAreValid
	self
		assertValid: '[{},[1],true,null,1,"{}"]'
		description: 'unique heterogeneous types are valid'