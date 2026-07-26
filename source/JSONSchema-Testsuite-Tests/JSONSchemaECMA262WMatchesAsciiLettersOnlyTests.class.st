Class {
	#name : 'JSONSchemaECMA262WMatchesAsciiLettersOnlyTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262WMatchesAsciiLettersOnlyTests >> expectedFailures [
	^ #(#testASCIIAMatches #testLatin1EAcuteDoesNotMatchUnlikeEGPython)
]

{ #category : 'accessing' }
JSONSchemaECMA262WMatchesAsciiLettersOnlyTests >> schemaString [
	^ '{"pattern":"^\\w$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262WMatchesAsciiLettersOnlyTests >> testASCIIAMatches [
	self assertValid: '"a"' description: 'ASCII ''a'' matches'
]

{ #category : 'tests' }
JSONSchemaECMA262WMatchesAsciiLettersOnlyTests >> testLatin1EAcuteDoesNotMatchUnlikeEGPython [
	self
		assertInvalid: '"é"'
		description: 'latin-1 e-acute does not match (unlike e.g. Python)'
]
