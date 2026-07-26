Class {
	#name : 'JSONSchemaECMA262WMatchesEverythingButAsciiLettersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262WMatchesEverythingButAsciiLettersTests >> expectedFailures [
	^ #(#testLatin1EAcuteMatchesUnlikeEGPython #testASCIIADoesNotMatch)
]

{ #category : 'accessing' }
JSONSchemaECMA262WMatchesEverythingButAsciiLettersTests >> schemaString [
	^ '{"pattern":"^\\W$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262WMatchesEverythingButAsciiLettersTests >> testASCIIADoesNotMatch [
	self assertInvalid: '"a"' description: 'ASCII ''a'' does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262WMatchesEverythingButAsciiLettersTests >> testLatin1EAcuteMatchesUnlikeEGPython [
	self
		assertValid: '"é"'
		description: 'latin-1 e-acute matches (unlike e.g. Python)'
]
