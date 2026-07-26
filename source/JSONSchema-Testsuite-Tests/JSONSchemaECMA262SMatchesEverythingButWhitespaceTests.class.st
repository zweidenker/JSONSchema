Class {
	#name : 'JSONSchemaECMA262SMatchesEverythingButWhitespaceTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> expectedFailures [
	^ #(#testLineTabulationDoesNotMatch #testCharacterTabulationDoesNotMatch #testLatin1NonBreakingSpaceDoesNotMatch #testFormFeedDoesNotMatch #testASCIISpaceDoesNotMatch #testZeroWidthWhitespaceDoesNotMatch #testLineFeedDoesNotMatchLineTerminator #testParagraphSeparatorDoesNotMatchLineTerminator #testNonWhitespaceControlMatches #testEMSPACEDoesNotMatchSpaceSeparator #testNonWhitespaceMatches)
]

{ #category : 'accessing' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> schemaString [
	^ '{"pattern":"^\\S$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testASCIISpaceDoesNotMatch [
	self assertInvalid: '" "' description: 'ASCII space does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testCharacterTabulationDoesNotMatch [
	self
		assertInvalid: '"\t"'
		description: 'Character tabulation does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testEMSPACEDoesNotMatchSpaceSeparator [
	self
		assertInvalid: '" "'
		description: 'EM SPACE does not match (Space_Separator)'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testFormFeedDoesNotMatch [
	self assertInvalid: '"\f"' description: 'Form feed does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testLatin1NonBreakingSpaceDoesNotMatch [
	self
		assertInvalid: '" "'
		description: 'latin-1 non-breaking-space does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testLineFeedDoesNotMatchLineTerminator [
	self
		assertInvalid: '"\n"'
		description: 'line feed does not match (line terminator)'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testLineTabulationDoesNotMatch [
	self
		assertInvalid: '"\u000B"'
		description: 'Line tabulation does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testNonWhitespaceControlMatches [
	self
		assertValid: '"\u0001"'
		description: 'Non-whitespace control matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testNonWhitespaceMatches [
	self assertValid: '"–"' description: 'Non-whitespace matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testParagraphSeparatorDoesNotMatchLineTerminator [
	self
		assertInvalid: '" "'
		description: 'paragraph separator does not match (line terminator)'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesEverythingButWhitespaceTests >> testZeroWidthWhitespaceDoesNotMatch [
	self
		assertInvalid: '""'
		description: 'zero-width whitespace does not match'
]
