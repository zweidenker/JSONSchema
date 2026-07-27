Class {
	#name : 'JSONSchemaForbiddenPropertyTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Not',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Not'
}

{ #category : 'testing' }
JSONSchemaForbiddenPropertyTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaForbiddenPropertyTests >> schemaString [
	^ '{"properties":{"foo":{"not":{}}}}'
]

{ #category : 'tests' }
JSONSchemaForbiddenPropertyTests >> testPropertyAbsent [
	self assertValid: '{"bar":1,"baz":2}' description: 'property absent'
]

{ #category : 'tests' }
JSONSchemaForbiddenPropertyTests >> testPropertyPresent [
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'property present'
]
