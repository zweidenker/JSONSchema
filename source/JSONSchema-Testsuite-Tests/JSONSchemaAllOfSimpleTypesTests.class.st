Class {
	#name : 'JSONSchemaAllOfSimpleTypesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfSimpleTypesTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfSimpleTypesTests >> schemaString [
	^ '{"allOf":[{"maximum":30},{"minimum":20}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfSimpleTypesTests >> testMismatchOne [
	self assertInvalid: '35' description: 'mismatch one'
]

{ #category : 'tests' }
JSONSchemaAllOfSimpleTypesTests >> testValid [
	self assertValid: '25' description: 'valid'
]
