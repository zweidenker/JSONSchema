tests
testIllegalFirstCharU302EHangulSingleDotToneMark
	self
		assertInvalid: '"〮실례.테스트"'
		description: 'illegal first char U+302E Hangul single dot tone mark'