tests
testValidTree
	self
		assertValid:
			'{"nodes":[{"value":1,"subtree":{"nodes":[{"value":1.1},{"value":1.2}],"meta":"child"}},{"value":2,"subtree":{"nodes":[{"value":2.1},{"value":2.2}],"meta":"child"}}],"meta":"root"}'
		description: 'valid tree'