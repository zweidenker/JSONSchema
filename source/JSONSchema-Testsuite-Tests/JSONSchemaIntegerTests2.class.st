Class {
	#name : 'JSONSchemaIntegerTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaIntegerTests2 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIntegerTests2 >> schemaString [
	^ '{"type":"integer"}'
]

{ #category : 'tests' }
JSONSchemaIntegerTests2 >> testANegativeBignumIsAnInteger [
	self
		assertValid: '-12345678910111213141516171819202122232425262728293031'
		description: 'a negative bignum is an integer'
]
