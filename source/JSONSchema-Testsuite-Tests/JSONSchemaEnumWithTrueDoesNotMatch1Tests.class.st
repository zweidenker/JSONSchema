Class {
	#name : 'JSONSchemaEnumWithTrueDoesNotMatch1Tests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaEnumWithTrueDoesNotMatch1Tests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaEnumWithTrueDoesNotMatch1Tests >> schemaString [
	^ '{"enum":[true]}'
]

{ #category : 'tests' }
JSONSchemaEnumWithTrueDoesNotMatch1Tests >> testFloatOneIsInvalid [
	self assertInvalid: '1.0' description: 'float one is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumWithTrueDoesNotMatch1Tests >> testIntegerOneIsInvalid [
	self assertInvalid: '1' description: 'integer one is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumWithTrueDoesNotMatch1Tests >> testTrueIsValid [
	self assertValid: 'true' description: 'true is valid'
]
