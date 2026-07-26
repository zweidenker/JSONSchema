Class {
	#name : 'JSONSchemaIgnoreElseWithoutIfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaIgnoreElseWithoutIfTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIgnoreElseWithoutIfTests >> schemaString [
	^ '{"else":{"const":0}}'
]

{ #category : 'tests' }
JSONSchemaIgnoreElseWithoutIfTests >> testValidWhenInvalidAgainstLoneElse [
	self
		assertValid: '"hello"'
		description: 'valid when invalid against lone else'
]

{ #category : 'tests' }
JSONSchemaIgnoreElseWithoutIfTests >> testValidWhenValidAgainstLoneElse [
	self
		assertValid: '0'
		description: 'valid when valid against lone else'
]
