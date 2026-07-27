Class {
	#name : 'JSONSchemaECMA262DMatchesEverythingButAsciiDigitsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262DMatchesEverythingButAsciiDigitsTests >> expectedFailures [
	^ #(#testNKODIGITZEROMatchesUnlikeEGPython #testNKODIGITZEROAsUEscapeMatches)
]

{ #category : 'accessing' }
JSONSchemaECMA262DMatchesEverythingButAsciiDigitsTests >> schemaString [
	^ '{"pattern":"^\\D$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262DMatchesEverythingButAsciiDigitsTests >> testASCIIZeroDoesNotMatch [
	self assertInvalid: '"0"' description: 'ASCII zero does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262DMatchesEverythingButAsciiDigitsTests >> testNKODIGITZEROAsUEscapeMatches [
	self
		assertValid: '"߀"'
		description: 'NKO DIGIT ZERO (as \u escape) matches'
]

{ #category : 'tests' }
JSONSchemaECMA262DMatchesEverythingButAsciiDigitsTests >> testNKODIGITZEROMatchesUnlikeEGPython [
	self
		assertValid: '"߀"'
		description: 'NKO DIGIT ZERO matches (unlike e.g. Python)'
]
