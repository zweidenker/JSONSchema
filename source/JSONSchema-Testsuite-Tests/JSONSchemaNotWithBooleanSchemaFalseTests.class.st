Class {
	#name : 'JSONSchemaNotWithBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Not',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Not'
}

{ #category : 'testing' }
JSONSchemaNotWithBooleanSchemaFalseTests >> expectedFailures [
	^ #(#testAnyValueIsValid)
]

{ #category : 'accessing' }
JSONSchemaNotWithBooleanSchemaFalseTests >> schemaString [
	^ '{"not":false}'
]

{ #category : 'tests' }
JSONSchemaNotWithBooleanSchemaFalseTests >> testAnyValueIsValid [
	self assertValid: '"foo"' description: 'any value is valid'
]
