Class {
	#name : 'JSONSchemaNestedAnyOfToCheckValidationSemanticsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests2 >> expectedFailures [
	^ #(#testAnythingNonNullIsInvalid #testNullIsValid)
]

{ #category : 'accessing' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests2 >> schemaString [
	^ '{"anyOf":[{"anyOf":[{"type":"null"}]}]}'
]

{ #category : 'tests' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests2 >> testAnythingNonNullIsInvalid [
	self assertInvalid: '123' description: 'anything non-null is invalid'
]

{ #category : 'tests' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests2 >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]
