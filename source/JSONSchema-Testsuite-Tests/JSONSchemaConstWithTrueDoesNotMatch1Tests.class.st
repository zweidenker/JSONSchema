Class {
	#name : 'JSONSchemaConstWithTrueDoesNotMatch1Tests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaConstWithTrueDoesNotMatch1Tests >> schemaString [
	^ '{"const":true}'
]

{ #category : 'tests' }
JSONSchemaConstWithTrueDoesNotMatch1Tests >> testFloatOneIsInvalid [
	self assertInvalid: '1.0' description: 'float one is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithTrueDoesNotMatch1Tests >> testIntegerOneIsInvalid [
	self assertInvalid: '1' description: 'integer one is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithTrueDoesNotMatch1Tests >> testTrueIsValid [
	self assertValid: 'true' description: 'true is valid'
]
