tests
testMissingDependency
	self assertInvalid: '{"bar":2}' description: 'missing dependency'