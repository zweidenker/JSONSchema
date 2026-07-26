Class {
	#name : 'JSONSchemaByNumberTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MultipleOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MultipleOf'
}

{ #category : 'testing' }
JSONSchemaByNumberTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaByNumberTests >> schemaString [
	^ '{"multipleOf":1.5}'
]

{ #category : 'tests' }
JSONSchemaByNumberTests >> test35IsNotMultipleOf15 [
	self assertInvalid: '35' description: '35 is not multiple of 1.5'
]

{ #category : 'tests' }
JSONSchemaByNumberTests >> test45IsMultipleOf15 [
	self assertValid: '4.5' description: '4.5 is multiple of 1.5'
]

{ #category : 'tests' }
JSONSchemaByNumberTests >> testZeroIsMultipleOfAnything [
	self assertValid: '0' description: 'zero is multiple of anything'
]
