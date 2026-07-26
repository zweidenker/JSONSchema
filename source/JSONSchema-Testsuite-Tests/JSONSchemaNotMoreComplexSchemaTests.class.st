Class {
	#name : 'JSONSchemaNotMoreComplexSchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Not',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Not'
}

{ #category : 'testing' }
JSONSchemaNotMoreComplexSchemaTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaNotMoreComplexSchemaTests >> schemaString [
	^ '{"not":{"properties":{"foo":{"type":"string"}},"type":"object"}}'
]

{ #category : 'tests' }
JSONSchemaNotMoreComplexSchemaTests >> testMatch [
	self assertValid: '1' description: 'match'
]

{ #category : 'tests' }
JSONSchemaNotMoreComplexSchemaTests >> testMismatch [
	self assertInvalid: '{"foo":"bar"}' description: 'mismatch'
]

{ #category : 'tests' }
JSONSchemaNotMoreComplexSchemaTests >> testOtherMatch [
	self assertValid: '{"foo":1}' description: 'other match'
]
