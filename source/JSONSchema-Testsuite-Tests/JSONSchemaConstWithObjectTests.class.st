Class {
	#name : 'JSONSchemaConstWithObjectTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'testing' }
JSONSchemaConstWithObjectTests >> expectedFailures [
	^ #(#testAnotherObjectIsInvalid #testAnotherTypeIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaConstWithObjectTests >> schemaString [
	^ '{"const":{"foo":"bar","baz":"bax"}}'
]

{ #category : 'tests' }
JSONSchemaConstWithObjectTests >> testAnotherObjectIsInvalid [
	self
		assertInvalid: '{"foo":"bar"}'
		description: 'another object is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithObjectTests >> testAnotherTypeIsInvalid [
	self assertInvalid: '[1,2]' description: 'another type is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWithObjectTests >> testSameObjectIsValid [
	self
		assertValid: '{"foo":"bar","baz":"bax"}'
		description: 'same object is valid'
]

{ #category : 'tests' }
JSONSchemaConstWithObjectTests >> testSameObjectWithDifferentPropertyOrderIsValid [
	self
		assertValid: '{"foo":"bar","baz":"bax"}'
		description: 'same object with different property order is valid'
]
