Class {
	#name : 'JSONSchemaNestedOneOfToCheckValidationSemanticsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaNestedOneOfToCheckValidationSemanticsTests >> expectedFailures [
	^ #(#testAnythingNonNullIsInvalid #testNullIsValid)
]

{ #category : 'accessing' }
JSONSchemaNestedOneOfToCheckValidationSemanticsTests >> schemaString [
	^ '{"oneOf":[{"oneOf":[{"type":"null"}]}]}'
]

{ #category : 'tests' }
JSONSchemaNestedOneOfToCheckValidationSemanticsTests >> testAnythingNonNullIsInvalid [
	self assertInvalid: '123' description: 'anything non-null is invalid'
]

{ #category : 'tests' }
JSONSchemaNestedOneOfToCheckValidationSemanticsTests >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]
