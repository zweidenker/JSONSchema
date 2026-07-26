Class {
	#name : 'JSONSchemaECMA262RegexEscapesControlCodesWithCAndLowerLetterTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndLowerLetterTests >> expectedFailures [
	^ #(#testMatches)
]

{ #category : 'accessing' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndLowerLetterTests >> schemaString [
	^ '{"pattern":"^\\cc$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndLowerLetterTests >> testDoesNotMatch [
	self assertInvalid: '"\\cc"' description: 'does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndLowerLetterTests >> testMatches [
	self assertValid: '"\u0003"' description: 'matches'
]
