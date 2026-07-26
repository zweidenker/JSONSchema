Class {
	#name : 'JSONSchemaPropertyNamesWithBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PropertyNames',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PropertyNames'
}

{ #category : 'testing' }
JSONSchemaPropertyNamesWithBooleanSchemaFalseTests >> expectedFailures [
	^ #(#testObjectWithAnyPropertiesIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaPropertyNamesWithBooleanSchemaFalseTests >> schemaString [
	^ '{"propertyNames":false}'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesWithBooleanSchemaFalseTests >> testEmptyObjectIsValid [
	self assertValid: '{}' description: 'empty object is valid'
]

{ #category : 'tests' }
JSONSchemaPropertyNamesWithBooleanSchemaFalseTests >> testObjectWithAnyPropertiesIsInvalid [
	self
		assertInvalid: '{"foo":1}'
		description: 'object with any properties is invalid'
]
