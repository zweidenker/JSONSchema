Class {
	#name : 'JSONSchemaFloatComparisonWithHighPrecisionTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaFloatComparisonWithHighPrecisionTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaFloatComparisonWithHighPrecisionTests >> schemaString [
	^ '{"exclusiveMaximum":9.727837981879871e26}'
]

{ #category : 'tests' }
JSONSchemaFloatComparisonWithHighPrecisionTests >> testComparisonWorksForHighNumbers [
	self
		assertInvalid: '9.727837981879871e26'
		description: 'comparison works for high numbers'
]
