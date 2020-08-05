tests
testNotDeepEnough
	self
		assertInvalid: '[[[1],[2],[3]],[[4],[5],[6]]]'
		description: 'not deep enough'