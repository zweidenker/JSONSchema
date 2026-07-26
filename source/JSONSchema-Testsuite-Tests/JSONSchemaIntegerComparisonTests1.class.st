Class {
	#name : 'JSONSchemaIntegerComparisonTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaIntegerComparisonTests1 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaIntegerComparisonTests1 >> schemaString [
	^ '{"maximum":18446744073709551615}'
]

{ #category : 'tests' }
JSONSchemaIntegerComparisonTests1 >> testComparisonWorksForHighNumbers [
	self
		assertValid: '18446744073709551600'
		description: 'comparison works for high numbers'
]
