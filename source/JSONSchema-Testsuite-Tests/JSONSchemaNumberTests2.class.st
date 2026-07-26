Class {
	#name : 'JSONSchemaNumberTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaNumberTests2 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaNumberTests2 >> schemaString [
	^ '{"type":"number"}'
]

{ #category : 'tests' }
JSONSchemaNumberTests2 >> testANegativeBignumIsANumber [
	self
		assertValid: '-98249283749234923498293171823948729348710298301928331'
		description: 'a negative bignum is a number'
]
