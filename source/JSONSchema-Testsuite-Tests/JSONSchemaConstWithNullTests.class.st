Class {
	#name : 'JSONSchemaConstWithNullTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaConstWithNullTests >> schemaString [
	^ '{"const":null}'
]

{ #category : 'tests' }
JSONSchemaConstWithNullTests >> testNotNullIsInvalid [
	self assertInvalid: '0' description: 'not null is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithNullTests >> testNullIsValid [
	self assertValid: 'null' description: 'null is valid'
]
