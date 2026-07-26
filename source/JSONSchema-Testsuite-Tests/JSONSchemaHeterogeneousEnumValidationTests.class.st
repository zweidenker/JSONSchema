Class {
	#name : 'JSONSchemaHeterogeneousEnumValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaHeterogeneousEnumValidationTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaHeterogeneousEnumValidationTests >> schemaString [
	^ '{"enum":[6,"foo",[],true,{"foo":12}]}'
]

{ #category : 'tests' }
JSONSchemaHeterogeneousEnumValidationTests >> testObjectsAreDeepCompared [
	self
		assertInvalid: '{"foo":false}'
		description: 'objects are deep compared'
]

{ #category : 'tests' }
JSONSchemaHeterogeneousEnumValidationTests >> testOneOfTheEnumIsValid [
	self assertValid: '[]' description: 'one of the enum is valid'
]

{ #category : 'tests' }
JSONSchemaHeterogeneousEnumValidationTests >> testSomethingElseIsInvalid [
	self assertInvalid: 'null' description: 'something else is invalid'
]
