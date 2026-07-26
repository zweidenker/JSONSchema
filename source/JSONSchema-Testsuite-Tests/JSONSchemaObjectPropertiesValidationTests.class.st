Class {
	#name : 'JSONSchemaObjectPropertiesValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Properties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Properties'
}

{ #category : 'testing' }
JSONSchemaObjectPropertiesValidationTests >> expectedFailures [
	^ #(#testIgnoresArrays #testIgnoresOtherNonObjects)
]

{ #category : 'accessing' }
JSONSchemaObjectPropertiesValidationTests >> schemaString [
	^ '{"properties":{"foo":{"type":"integer"},"bar":{"type":"string"}}}'
]

{ #category : 'tests' }
JSONSchemaObjectPropertiesValidationTests >> testBothPropertiesInvalidIsInvalid [
	self
		assertInvalid: '{"foo":[],"bar":{}}'
		description: 'both properties invalid is invalid'
]

{ #category : 'tests' }
JSONSchemaObjectPropertiesValidationTests >> testBothPropertiesPresentAndValidIsValid [
	self
		assertValid: '{"foo":1,"bar":"baz"}'
		description: 'both properties present and valid is valid'
]

{ #category : 'tests' }
JSONSchemaObjectPropertiesValidationTests >> testDoesnTInvalidateOtherProperties [
	self
		assertValid: '{"quux":[]}'
		description: 'doesn''t invalidate other properties'
]

{ #category : 'tests' }
JSONSchemaObjectPropertiesValidationTests >> testIgnoresArrays [
	self assertValid: '[]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaObjectPropertiesValidationTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaObjectPropertiesValidationTests >> testOnePropertyInvalidIsInvalid [
	self
		assertInvalid: '{"foo":1,"bar":{}}'
		description: 'one property invalid is invalid'
]
