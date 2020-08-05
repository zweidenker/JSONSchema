tests
testInvalidTree
	self
		assertInvalid:
			'{"nodes":[{"value":1,"subtree":{"nodes":[{"value":"string is invalid"},{"value":1.2}],"meta":"child"}},{"value":2,"subtree":{"nodes":[{"value":2.1},{"value":2.2}],"meta":"child"}}],"meta":"root"}'
		description: 'invalid tree'