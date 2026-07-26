Class {
	#name : 'JSONSchemaNestedAllOfToCheckValidationSemanticsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaNestedAllOfToCheckValidationSemanticsTests >> expectedFailures [
	^ #(#testAnythingNonNullIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaNestedAllOfToCheckValidationSemanticsTests >> schemaString [
	^ '{"allOf":[{"allOf":[{"type":"null"}]}]}'
]

{ #category : 'tests' }
JSONSchemaNestedAllOfToCheckValidationSemanticsTests >> testAnythingNonNullIsInvalid [
	self assertInvalid: '123' description: 'anything non-null is invalid'
]

{ #category : 'tests' }
JSONSchemaNestedAllOfToCheckValidationSemanticsTests >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]
