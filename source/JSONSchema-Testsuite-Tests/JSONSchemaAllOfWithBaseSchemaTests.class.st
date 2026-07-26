Class {
	#name : 'JSONSchemaAllOfWithBaseSchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithBaseSchemaTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfWithBaseSchemaTests >> schemaString [
	^ '{"allOf":[{"properties":{"foo":{"type":"string"}},"required":["foo"]},{"properties":{"baz":{"type":"null"}},"required":["baz"]}],"properties":{"bar":{"type":"integer"}},"required":["bar"]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBaseSchemaTests >> testMismatchBaseSchema [
	self
		assertInvalid: '{"foo":"quux","baz":null}'
		description: 'mismatch base schema'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBaseSchemaTests >> testMismatchBoth [
	self assertInvalid: '{"bar":2}' description: 'mismatch both'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBaseSchemaTests >> testMismatchFirstAllOf [
	self
		assertInvalid: '{"bar":2,"baz":null}'
		description: 'mismatch first allOf'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBaseSchemaTests >> testMismatchSecondAllOf [
	self
		assertInvalid: '{"foo":"quux","bar":2}'
		description: 'mismatch second allOf'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBaseSchemaTests >> testValid [
	self
		assertValid: '{"foo":"quux","bar":2,"baz":null}'
		description: 'valid'
]
