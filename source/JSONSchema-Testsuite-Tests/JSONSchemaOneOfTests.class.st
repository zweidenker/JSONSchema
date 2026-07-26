Class {
	#name : 'JSONSchemaOneOfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfTests >> expectedFailures [
	^ #(#testFirstOneOfValid #testSecondOneOfValid #testBothOneOfValid #testNeitherOneOfValid)
]

{ #category : 'accessing' }
JSONSchemaOneOfTests >> schemaString [
	^ '{"oneOf":[{"type":"integer"},{"minimum":2}]}'
]

{ #category : 'tests' }
JSONSchemaOneOfTests >> testBothOneOfValid [
	self assertInvalid: '3' description: 'both oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfTests >> testFirstOneOfValid [
	self assertValid: '1' description: 'first oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfTests >> testNeitherOneOfValid [
	self assertInvalid: '1.5' description: 'neither oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfTests >> testSecondOneOfValid [
	self assertValid: '2.5' description: 'second oneOf valid'
]
