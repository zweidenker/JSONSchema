Class {
	#name : 'JSONSchemaFloatComparisonWithHighPrecisionOnNegativeNumbersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Bignum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Bignum'
}

{ #category : 'testing' }
JSONSchemaFloatComparisonWithHighPrecisionOnNegativeNumbersTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaFloatComparisonWithHighPrecisionOnNegativeNumbersTests >> schemaString [
	^ '{"exclusiveMinimum":-9.727837981879871e26}'
]

{ #category : 'tests' }
JSONSchemaFloatComparisonWithHighPrecisionOnNegativeNumbersTests >> testComparisonWorksForVeryNegativeNumbers [
	self
		assertInvalid: '-9.727837981879871e26'
		description: 'comparison works for very negative numbers'
]
