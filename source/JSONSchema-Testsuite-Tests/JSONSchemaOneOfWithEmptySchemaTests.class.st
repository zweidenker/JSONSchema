Class {
	#name : 'JSONSchemaOneOfWithEmptySchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithEmptySchemaTests >> expectedFailures [
	^ #(#testOneValidValid #testBothValidInvalid)
]

{ #category : 'accessing' }
JSONSchemaOneOfWithEmptySchemaTests >> schemaString [
	^ '{"oneOf":[{"type":"number"},{}]}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithEmptySchemaTests >> testBothValidInvalid [
	self assertInvalid: '123' description: 'both valid - invalid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithEmptySchemaTests >> testOneValidValid [
	self assertValid: '"foo"' description: 'one valid - valid'
]
