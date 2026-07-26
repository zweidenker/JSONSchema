Class {
	#name : 'JSONSchemaPropertyNamedRefContainingAnActualRefTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaPropertyNamedRefContainingAnActualRefTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaPropertyNamedRefContainingAnActualRefTests >> schemaString [
	^ '{"definitions":{"is-string":{"type":"string"}},"properties":{"$ref":{"$ref":"#/definitions/is-string"}}}'
]

{ #category : 'tests' }
JSONSchemaPropertyNamedRefContainingAnActualRefTests >> testPropertyNamedRefInvalid [
	self
		assertInvalid: '{"$ref":2}'
		description: 'property named $ref invalid'
]

{ #category : 'tests' }
JSONSchemaPropertyNamedRefContainingAnActualRefTests >> testPropertyNamedRefValid [
	self
		assertValid: '{"$ref":"a"}'
		description: 'property named $ref valid'
]
