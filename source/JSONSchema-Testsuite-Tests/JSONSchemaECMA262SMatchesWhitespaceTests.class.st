Class {
	#name : 'JSONSchemaECMA262SMatchesWhitespaceTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262SMatchesWhitespaceTests >> expectedFailures [
	^ #(#testParagraphSeparatorMatchesLineTerminator #testLineTabulationMatches #testLatin1NonBreakingSpaceMatches #testZeroWidthWhitespaceMatches #testEMSPACEMatchesSpaceSeparator)
]

{ #category : 'accessing' }
JSONSchemaECMA262SMatchesWhitespaceTests >> schemaString [
	^ '{"pattern":"^\\s$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testASCIISpaceMatches [
	self assertValid: '" "' description: 'ASCII space matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testCharacterTabulationMatches [
	self assertValid: '"\t"' description: 'Character tabulation matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testEMSPACEMatchesSpaceSeparator [
	self
		assertValid: '" "'
		description: 'EM SPACE matches (Space_Separator)'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testFormFeedMatches [
	self assertValid: '"\f"' description: 'Form feed matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testLatin1NonBreakingSpaceMatches [
	self
		assertValid: '" "'
		description: 'latin-1 non-breaking-space matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testLineFeedMatchesLineTerminator [
	self
		assertValid: '"\n"'
		description: 'line feed matches (line terminator)'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testLineTabulationMatches [
	self assertValid: '"\u000B"' description: 'Line tabulation matches'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testNonWhitespaceControlDoesNotMatch [
	self
		assertInvalid: '"\u0001"'
		description: 'Non-whitespace control does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testNonWhitespaceDoesNotMatch [
	self
		assertInvalid: '"–"'
		description: 'Non-whitespace does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testParagraphSeparatorMatchesLineTerminator [
	self
		assertValid: '" "'
		description: 'paragraph separator matches (line terminator)'
]

{ #category : 'tests' }
JSONSchemaECMA262SMatchesWhitespaceTests >> testZeroWidthWhitespaceMatches [
	self assertValid: '""' description: 'zero-width whitespace matches'
]
