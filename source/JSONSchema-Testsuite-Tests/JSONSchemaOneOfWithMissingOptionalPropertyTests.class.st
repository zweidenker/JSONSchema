Class {
	#name : 'JSONSchemaOneOfWithMissingOptionalPropertyTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithMissingOptionalPropertyTests >> expectedFailures [
	^ #(#testFirstOneOfValid #testSecondOneOfValid #testBothOneOfValid #testNeitherOneOfValid)
]

{ #category : 'accessing' }
JSONSchemaOneOfWithMissingOptionalPropertyTests >> schemaString [
	^ '{"oneOf":[{"properties":{"bar":true,"baz":true},"required":["bar"]},{"properties":{"foo":true},"required":["foo"]}]}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithMissingOptionalPropertyTests >> testBothOneOfValid [
	self
		assertInvalid: '{"foo":"foo","bar":8}'
		description: 'both oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithMissingOptionalPropertyTests >> testFirstOneOfValid [
	self assertValid: '{"bar":8}' description: 'first oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithMissingOptionalPropertyTests >> testNeitherOneOfValid [
	self
		assertInvalid: '{"baz":"quux"}'
		description: 'neither oneOf valid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithMissingOptionalPropertyTests >> testSecondOneOfValid [
	self assertValid: '{"foo":"foo"}' description: 'second oneOf valid'
]
