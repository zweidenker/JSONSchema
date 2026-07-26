Class {
	#name : 'JSONSchemaProperUTF16SurrogatePairHandlingPatternTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-NonBmpRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'NonBmpRegex'
}

{ #category : 'testing' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> schemaString [
	^ '{"pattern":"^🐲*$"}'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testDoesnTMatchOne [
	self assertInvalid: '"🐉"' description: 'doesn''t match one'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testDoesnTMatchOneASCII [
	self assertInvalid: '"D"' description: 'doesn''t match one ASCII'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testDoesnTMatchTwo [
	self assertInvalid: '"🐉🐉"' description: 'doesn''t match two'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testDoesnTMatchTwoASCII [
	self assertInvalid: '"DD"' description: 'doesn''t match two ASCII'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testMatchesEmpty [
	self assertValid: '""' description: 'matches empty'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testMatchesSingle [
	self assertValid: '"🐲"' description: 'matches single'
]

{ #category : 'tests' }
JSONSchemaProperUTF16SurrogatePairHandlingPatternTests >> testMatchesTwo [
	self assertValid: '"🐲🐲"' description: 'matches two'
]
