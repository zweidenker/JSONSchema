Class {
	#name : 'JSONSchemaPropertyNamedRefThatIsNotAReferenceTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaPropertyNamedRefThatIsNotAReferenceTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaPropertyNamedRefThatIsNotAReferenceTests >> schemaString [
	^ '{"properties":{"$ref":{"type":"string"}}}'
]

{ #category : 'tests' }
JSONSchemaPropertyNamedRefThatIsNotAReferenceTests >> testPropertyNamedRefInvalid [
	self
		assertInvalid: '{"$ref":2}'
		description: 'property named $ref invalid'
]

{ #category : 'tests' }
JSONSchemaPropertyNamedRefThatIsNotAReferenceTests >> testPropertyNamedRefValid [
	self
		assertValid: '{"$ref":"a"}'
		description: 'property named $ref valid'
]
