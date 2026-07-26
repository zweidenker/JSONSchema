Class {
	#name : 'JSONSchemaECMA262DMatchesAsciiDigitsOnlyTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262DMatchesAsciiDigitsOnlyTests >> expectedFailures [
	^ #(#testNKODIGITZERODoesNotMatchUnlikeEGPython #testNKODIGITZEROAsUEscapeDoesNotMatch)
]

{ #category : 'accessing' }
JSONSchemaECMA262DMatchesAsciiDigitsOnlyTests >> schemaString [
	^ '{"pattern":"^\\d$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262DMatchesAsciiDigitsOnlyTests >> testASCIIZeroMatches [
	self assertValid: '"0"' description: 'ASCII zero matches'
]

{ #category : 'tests' }
JSONSchemaECMA262DMatchesAsciiDigitsOnlyTests >> testNKODIGITZEROAsUEscapeDoesNotMatch [
	self
		assertInvalid: '"߀"'
		description: 'NKO DIGIT ZERO (as \u escape) does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262DMatchesAsciiDigitsOnlyTests >> testNKODIGITZERODoesNotMatchUnlikeEGPython [
	self
		assertInvalid: '"߀"'
		description: 'NKO DIGIT ZERO does not match (unlike e.g. Python)'
]
