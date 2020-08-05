tests
testEndsWithHyphen
	self assertInvalid: '"hostname-"' description: 'ends with hyphen'