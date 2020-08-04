tests
testAnInvalidIRIThoughValidIRIReference
	self
		assertInvalid: '"âππ"'
		description: 'an invalid IRI though valid IRI reference'