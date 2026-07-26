Class {
	#name : 'JSONSchemaECMA262RegexEscapesControlCodesWithCAndUpperLetterTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndUpperLetterTests >> expectedFailures [
	^ #(#testMatches)
]

{ #category : 'accessing' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndUpperLetterTests >> schemaString [
	^ '{"pattern":"^\\cC$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndUpperLetterTests >> testDoesNotMatch [
	self assertInvalid: '"\\cC"' description: 'does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexEscapesControlCodesWithCAndUpperLetterTests >> testMatches [
	self assertValid: '"\u0003"' description: 'matches'
]
