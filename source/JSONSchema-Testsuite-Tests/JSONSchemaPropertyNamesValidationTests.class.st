Class {
	#name : 'JSONSchemaPropertyNamesValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PropertyNames',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PropertyNames'
}

{ #category : 'testing' }
JSONSchemaPropertyNamesValidationTests >> expectedFailures [
	^ #(#testSomePropertyNamesInvalid)
]

{ #category : 'accessing' }
JSONSchemaPropertyNamesValidationTests >> schemaString [
	^ '{"propertyNames":{"maxLength":3}}'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesValidationTests >> testAllPropertyNamesValid [
	self
		assertValid: '{"f":{},"foo":{}}'
		description: 'all property names valid'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesValidationTests >> testIgnoresArrays [
	self assertValid: '[1,2,3,4]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesValidationTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesValidationTests >> testIgnoresStrings [
	self assertValid: '"foobar"' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesValidationTests >> testObjectWithoutPropertiesIsValid [
	self
		assertValid: '{}'
		description: 'object without properties is valid'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesValidationTests >> testSomePropertyNamesInvalid [
	self
		assertInvalid: '{"foobar":{},"foo":{}}'
		description: 'some property names invalid'
]
