Class {
	#name : 'JSONSchemaPropertiesWithBooleanSchemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Properties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Properties'
}

{ #category : 'testing' }
JSONSchemaPropertiesWithBooleanSchemaTests >> expectedFailures [
	^ #(#testOnlyTruePropertyPresentIsValid #testOnlyFalsePropertyPresentIsInvalid #testBothPropertiesPresentIsInvalid #testNoPropertyPresentIsValid)
]

{ #category : 'accessing' }
JSONSchemaPropertiesWithBooleanSchemaTests >> schemaString [
	^ '{"properties":{"foo":true,"bar":false}}'
]

{ #category : 'tests' }
JSONSchemaPropertiesWithBooleanSchemaTests >> testBothPropertiesPresentIsInvalid [
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'both properties present is invalid'
]

{ #category : 'tests' }
JSONSchemaPropertiesWithBooleanSchemaTests >> testNoPropertyPresentIsValid [
	self assertValid: '{}' description: 'no property present is valid'
]

{ #category : 'tests' }
JSONSchemaPropertiesWithBooleanSchemaTests >> testOnlyFalsePropertyPresentIsInvalid [
	self
		assertInvalid: '{"bar":2}'
		description: 'only ''false'' property present is invalid'
]

{ #category : 'tests' }
JSONSchemaPropertiesWithBooleanSchemaTests >> testOnlyTruePropertyPresentIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'only ''true'' property present is valid'
]
