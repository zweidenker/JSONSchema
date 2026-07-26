Class {
	#name : 'JSONSchemaMaxProperties0MeansTheObjectIsEmptyTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MaxProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MaxProperties'
}

{ #category : 'testing' }
JSONSchemaMaxProperties0MeansTheObjectIsEmptyTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaMaxProperties0MeansTheObjectIsEmptyTests >> schemaString [
	^ '{"maxProperties":0}'
]

{ #category : 'tests' }
JSONSchemaMaxProperties0MeansTheObjectIsEmptyTests >> testNoPropertiesIsValid [
	self assertValid: '{}' description: 'no properties is valid'
]

{ #category : 'tests' }
JSONSchemaMaxProperties0MeansTheObjectIsEmptyTests >> testOnePropertyIsInvalid [
	self
		assertInvalid: '{"foo":1}'
		description: 'one property is invalid'
]
