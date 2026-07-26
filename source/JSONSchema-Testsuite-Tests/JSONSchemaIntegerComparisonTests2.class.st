Class {
	#name : 'JSONSchemaIntegerComparisonTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaIntegerComparisonTests2 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIntegerComparisonTests2 >> schemaString [
	^ '{"minimum":-18446744073709551615}'
]

{ #category : 'tests' }
JSONSchemaIntegerComparisonTests2 >> testComparisonWorksForVeryNegativeNumbers [
	self
		assertValid: '-18446744073709551600'
		description: 'comparison works for very negative numbers'
]
