Class {
	#name : 'JSONSchemaNonASCIIPatternWithAdditionalPropertiesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AdditionalProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AdditionalProperties'
}

{ #category : 'accessing' }
JSONSchemaNonASCIIPatternWithAdditionalPropertiesTests >> schemaString [
	^ '{"patternProperties":{"^á":{}},"additionalProperties":false}'
]

{ #category : 'tests' }
JSONSchemaNonASCIIPatternWithAdditionalPropertiesTests >> testMatchingThePatternIsValid [
	self
		assertValid: '{"ármányos":2}'
		description: 'matching the pattern is valid'
]

{ #category : 'tests' }
JSONSchemaNonASCIIPatternWithAdditionalPropertiesTests >> testNotMatchingThePatternIsInvalid [
	self
		assertInvalid: '{"élmény":2}'
		description: 'not matching the pattern is invalid'
]
