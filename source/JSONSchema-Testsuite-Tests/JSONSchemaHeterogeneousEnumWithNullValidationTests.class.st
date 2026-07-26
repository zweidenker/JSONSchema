Class {
	#name : 'JSONSchemaHeterogeneousEnumWithNullValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaHeterogeneousEnumWithNullValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaHeterogeneousEnumWithNullValidationTests >> schemaString [
	^ '{"enum":[6,null]}'
]

{ #category : 'tests' }
JSONSchemaHeterogeneousEnumWithNullValidationTests >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]

{ #category : 'tests' }
JSONSchemaHeterogeneousEnumWithNullValidationTests >> testNumberIsValid [
	self assertValid: '6' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaHeterogeneousEnumWithNullValidationTests >> testSomethingElseIsInvalid [
	self assertInvalid: '"test"' description: 'something else is invalid'
]
