Class {
	#name : 'JSONSchemaNestedAnyOfToCheckValidationSemanticsTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests1 >> expectedFailures [
	^ #(#testAnythingNonNullIsInvalid #testNullIsValid)
]

{ #category : 'accessing' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests1 >> schemaString [
	^ '{"anyOf":[{"anyOf":[{"type":"null"}]}]}'
]

{ #category : 'tests' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests1 >> testAnythingNonNullIsInvalid [
	self assertInvalid: '123' description: 'anything non-null is invalid'
]

{ #category : 'tests' }
JSONSchemaNestedAnyOfToCheckValidationSemanticsTests1 >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]
