Class {
	#name : 'JSONSchemaConstWithFalseDoesNotMatch0Tests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaConstWithFalseDoesNotMatch0Tests >> schemaString [
	^ '{"const":false}'
]

{ #category : 'tests' }
JSONSchemaConstWithFalseDoesNotMatch0Tests >> testFalseIsValid [
	self assertValid: 'false' description: 'false is valid'
]

{ #category : 'tests' }
JSONSchemaConstWithFalseDoesNotMatch0Tests >> testFloatZeroIsInvalid [
	self assertInvalid: '0.0' description: 'float zero is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithFalseDoesNotMatch0Tests >> testIntegerZeroIsInvalid [
	self assertInvalid: '0' description: 'integer zero is invalid'
]
