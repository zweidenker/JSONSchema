Class {
	#name : 'JSONSchemaIgnoreThenWithoutIfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaIgnoreThenWithoutIfTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIgnoreThenWithoutIfTests >> schemaString [
	^ '{"then":{"const":0}}'
]

{ #category : 'tests' }
JSONSchemaIgnoreThenWithoutIfTests >> testValidWhenInvalidAgainstLoneThen [
	self
		assertValid: '"hello"'
		description: 'valid when invalid against lone then'
]

{ #category : 'tests' }
JSONSchemaIgnoreThenWithoutIfTests >> testValidWhenValidAgainstLoneThen [
	self
		assertValid: '0'
		description: 'valid when valid against lone then'
]
