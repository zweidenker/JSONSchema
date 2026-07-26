Class {
	#name : 'JSONSchemaBySmallNumberTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MultipleOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MultipleOf'
}

{ #category : 'testing' }
JSONSchemaBySmallNumberTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaBySmallNumberTests >> schemaString [
	^ '{"multipleOf":0.0001}'
]

{ #category : 'tests' }
JSONSchemaBySmallNumberTests >> test000751IsNotMultipleOf00001 [
	self
		assertInvalid: '0.00751'
		description: '0.00751 is not multiple of 0.0001'
]

{ #category : 'tests' }
JSONSchemaBySmallNumberTests >> test00075IsMultipleOf00001 [
	self
		assertValid: '0.0075'
		description: '0.0075 is multiple of 0.0001'
]
