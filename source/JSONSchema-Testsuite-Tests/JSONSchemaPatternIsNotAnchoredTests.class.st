Class {
	#name : 'JSONSchemaPatternIsNotAnchoredTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Pattern',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Pattern'
}

{ #category : 'testing' }
JSONSchemaPatternIsNotAnchoredTests >> expectedFailures [
	^ #(#testMatchesASubstring)
]

{ #category : 'accessing' }
JSONSchemaPatternIsNotAnchoredTests >> schemaString [
	^ '{"pattern":"a+"}'
]

{ #category : 'tests' }
JSONSchemaPatternIsNotAnchoredTests >> testMatchesASubstring [
	self assertValid: '"xxaayy"' description: 'matches a substring'
]
