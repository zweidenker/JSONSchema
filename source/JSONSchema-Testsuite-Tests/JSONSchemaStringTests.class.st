Class {
	#name : 'JSONSchemaStringTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaStringTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaStringTests >> schemaString [
	^ '{"type":"string"}'
]

{ #category : 'tests' }
JSONSchemaStringTests >> testABignumIsNotAString [
	self
		assertInvalid: '98249283749234923498293171823948729348710298301928331'
		description: 'a bignum is not a string'
]
