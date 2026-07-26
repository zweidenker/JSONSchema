Class {
	#name : 'JSONSchemaIgnoreIfWithoutThenOrElseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaIgnoreIfWithoutThenOrElseTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIgnoreIfWithoutThenOrElseTests >> schemaString [
	^ '{"if":{"const":0}}'
]

{ #category : 'tests' }
JSONSchemaIgnoreIfWithoutThenOrElseTests >> testValidWhenInvalidAgainstLoneIf [
	self
		assertValid: '"hello"'
		description: 'valid when invalid against lone if'
]

{ #category : 'tests' }
JSONSchemaIgnoreIfWithoutThenOrElseTests >> testValidWhenValidAgainstLoneIf [
	self assertValid: '0' description: 'valid when valid against lone if'
]
