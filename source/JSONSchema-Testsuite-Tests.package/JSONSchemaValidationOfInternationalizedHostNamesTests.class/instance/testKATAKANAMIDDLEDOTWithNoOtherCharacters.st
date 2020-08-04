tests
testKATAKANAMIDDLEDOTWithNoOtherCharacters
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"

	self
		assertInvalid: '"・"'
		description: 'KATAKANA MIDDLE DOT with no other characters'