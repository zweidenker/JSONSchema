Class {
	#name : 'JSONSchemaPatternPropertiesWithBooleanSchemasTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PatternProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PatternProperties'
}

{ #category : 'testing' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> expectedFailures [
	^ #(#testObjectWithPropertyMatchingSchemaFalseIsInvalid #testObjectWithBothPropertiesIsInvalid #testObjectWithAPropertyMatchingBothTrueAndFalseIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> schemaString [
	^ '{"patternProperties":{"f.*":true,"b.*":false}}'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> testEmptyObjectIsValid [
	self assertValid: '{}' description: 'empty object is valid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> testObjectWithAPropertyMatchingBothTrueAndFalseIsInvalid [
	self
		assertInvalid: '{"foobar":1}'
		description: 'object with a property matching both true and false is invalid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> testObjectWithBothPropertiesIsInvalid [
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'object with both properties is invalid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> testObjectWithPropertyMatchingSchemaFalseIsInvalid [
	self
		assertInvalid: '{"bar":2}'
		description: 'object with property matching schema false is invalid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesWithBooleanSchemasTests >> testObjectWithPropertyMatchingSchemaTrueIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'object with property matching schema true is valid'
]
