Class {
	#name : 'JSONSchemaOneOfWithRequiredTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithRequiredTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaOneOfWithRequiredTests >> schemaString [
	^ '{"oneOf":[{"required":["foo","bar"]},{"required":["foo","baz"]}],"type":"object"}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithRequiredTests >> testBothInvalidInvalid [
	self assertInvalid: '{"bar":2}' description: 'both invalid - invalid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithRequiredTests >> testBothValidInvalid [
	self
		assertInvalid: '{"foo":1,"bar":2,"baz":3}'
		description: 'both valid - invalid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithRequiredTests >> testFirstValidValid [
	self
		assertValid: '{"foo":1,"bar":2}'
		description: 'first valid - valid'
]

{ #category : 'tests' }
JSONSchemaOneOfWithRequiredTests >> testSecondValidValid [
	self
		assertValid: '{"foo":1,"baz":3}'
		description: 'second valid - valid'
]
