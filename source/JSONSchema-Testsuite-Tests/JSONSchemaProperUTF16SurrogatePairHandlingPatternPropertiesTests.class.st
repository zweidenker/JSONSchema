Class {
	#name : 'JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-NonBmpRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'NonBmpRegex'
}

{ #category : 'accessing' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests >> schemaString [
	^ '{"patternProperties":{"^🐲*$":{"type":"integer"}}}'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests >> testDoesnTMatchOne [
	self assertInvalid: '{"🐲":"hello"}' description: 'doesn''t match one'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests >> testDoesnTMatchTwo [
	self
		assertInvalid: '{"🐲🐲":"hello"}'
		description: 'doesn''t match two'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests >> testMatchesEmpty [
	self assertValid: '{"":1}' description: 'matches empty'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests >> testMatchesSingle [
	self assertValid: '{"🐲":1}' description: 'matches single'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternPropertiesTests >> testMatchesTwo [
	self assertValid: '{"🐲🐲":1}' description: 'matches two'
]
