tests
testContainsIllegalCharU302EHangulSingleDotToneMark
	self
		assertInvalid: '"실〮례.테스트"'
		description: 'contains illegal char U+302E Hangul single dot tone mark'