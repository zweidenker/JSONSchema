tests
testExceptionsThatAreDISALLOWEDLeftToRightChars
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6 Note: The two combining marks (U+302E and U+302F) are in the middle and not at the start"

	self
		assertInvalid: '"〱〲〳〴〵〮〯〻"'
		description: 'Exceptions that are DISALLOWED, left-to-right chars'