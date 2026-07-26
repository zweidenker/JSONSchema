Class {
	#name : 'JSONSchemaSimpleEnumValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaSimpleEnumValidationTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaSimpleEnumValidationTests >> schemaString [
	^ '{"enum":[1,2,3]}'
]

{ #category : 'tests' }
JSONSchemaSimpleEnumValidationTests >> testOneOfTheEnumIsValid [
	self assertValid: '1' description: 'one of the enum is valid'
]

{ #category : 'tests' }
JSONSchemaSimpleEnumValidationTests >> testSomethingElseIsInvalid [
	self assertInvalid: '4' description: 'something else is invalid'
]
