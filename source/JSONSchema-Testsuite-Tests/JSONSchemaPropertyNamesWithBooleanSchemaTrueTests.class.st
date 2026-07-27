Class {
	#name : 'JSONSchemaPropertyNamesWithBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PropertyNames',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PropertyNames'
}

{ #category : 'accessing' }
JSONSchemaPropertyNamesWithBooleanSchemaTrueTests >> schemaString [
	^ '{"propertyNames":true}'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesWithBooleanSchemaTrueTests >> testEmptyObjectIsValid [
	self assertValid: '{}' description: 'empty object is valid'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesWithBooleanSchemaTrueTests >> testObjectWithAnyPropertiesIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'object with any properties is valid'
]
