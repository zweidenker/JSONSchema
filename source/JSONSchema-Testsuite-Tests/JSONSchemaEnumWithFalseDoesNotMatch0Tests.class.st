Class {
	#name : 'JSONSchemaEnumWithFalseDoesNotMatch0Tests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaEnumWithFalseDoesNotMatch0Tests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaEnumWithFalseDoesNotMatch0Tests >> schemaString [
	^ '{"enum":[false]}'
]

{ #category : 'tests' }
JSONSchemaEnumWithFalseDoesNotMatch0Tests >> testFalseIsValid [
	self assertValid: 'false' description: 'false is valid'
]

{ #category : 'tests' }
JSONSchemaEnumWithFalseDoesNotMatch0Tests >> testFloatZeroIsInvalid [
	self assertInvalid: '0.0' description: 'float zero is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumWithFalseDoesNotMatch0Tests >> testIntegerZeroIsInvalid [
	self assertInvalid: '0' description: 'integer zero is invalid'
]
