Class {
	#name : 'JSONSchemaNumberTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaNumberTests1 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaNumberTests1 >> schemaString [
	^ '{"type":"number"}'
]

{ #category : 'tests' }
JSONSchemaNumberTests1 >> testABignumIsANumber [
	self
		assertValid: '98249283749234923498293171823948729348710298301928331'
		description: 'a bignum is a number'
]
