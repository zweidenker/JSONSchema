Class {
	#name : 'JSONSchemaIntegerTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaIntegerTests1 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIntegerTests1 >> schemaString [
	^ '{"type":"integer"}'
]

{ #category : 'tests' }
JSONSchemaIntegerTests1 >> testABignumIsAnInteger [
	self
		assertValid: '12345678910111213141516171819202122232425262728293031'
		description: 'a bignum is an integer'
]
