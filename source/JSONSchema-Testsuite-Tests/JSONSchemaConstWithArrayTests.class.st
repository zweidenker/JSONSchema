Class {
	#name : 'JSONSchemaConstWithArrayTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'testing' }
JSONSchemaConstWithArrayTests >> expectedFailures [
	^ #(#testAnotherArrayItemIsInvalid #testArrayWithAdditionalItemsIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaConstWithArrayTests >> schemaString [
	^ '{"const":[{"foo":"bar"}]}'
]

{ #category : 'tests' }
JSONSchemaConstWithArrayTests >> testAnotherArrayItemIsInvalid [
	self
		assertInvalid: '[2]'
		description: 'another array item is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithArrayTests >> testArrayWithAdditionalItemsIsInvalid [
	self
		assertInvalid: '[1,2,3]'
		description: 'array with additional items is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithArrayTests >> testSameArrayIsValid [
	self
		assertValid: '[{"foo":"bar"}]'
		description: 'same array is valid'
]
