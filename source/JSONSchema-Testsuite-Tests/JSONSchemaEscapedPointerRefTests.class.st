Class {
	#name : 'JSONSchemaEscapedPointerRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaEscapedPointerRefTests >> expectedFailures [
	^ #(#testTildeInvalid #testPercentValid #testPercentInvalid #testTildeValid #testSlashValid #testSlashInvalid)
]

{ #category : 'accessing' }
JSONSchemaEscapedPointerRefTests >> schemaString [
	^ '{"percent%field":{"type":"integer"},"tilde~field":{"type":"integer"},"properties":{"percent":{"$ref":"#/percent%25field"},"slash":{"$ref":"#/slash~1field"},"tilde":{"$ref":"#/tilde~0field"}},"slash/field":{"type":"integer"}}'
]

{ #category : 'tests' }
JSONSchemaEscapedPointerRefTests >> testPercentInvalid [
	self
		assertInvalid: '{"percent":"aoeu"}'
		description: 'percent invalid'
]

{ #category : 'tests' }
JSONSchemaEscapedPointerRefTests >> testPercentValid [
	self assertValid: '{"percent":123}' description: 'percent valid'
]

{ #category : 'tests' }
JSONSchemaEscapedPointerRefTests >> testSlashInvalid [
	self assertInvalid: '{"slash":"aoeu"}' description: 'slash invalid'
]

{ #category : 'tests' }
JSONSchemaEscapedPointerRefTests >> testSlashValid [
	self assertValid: '{"slash":123}' description: 'slash valid'
]

{ #category : 'tests' }
JSONSchemaEscapedPointerRefTests >> testTildeInvalid [
	self assertInvalid: '{"tilde":"aoeu"}' description: 'tilde invalid'
]

{ #category : 'tests' }
JSONSchemaEscapedPointerRefTests >> testTildeValid [
	self assertValid: '{"tilde":123}' description: 'tilde valid'
]
