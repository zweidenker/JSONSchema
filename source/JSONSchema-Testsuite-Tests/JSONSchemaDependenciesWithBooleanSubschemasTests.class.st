Class {
	#name : 'JSONSchemaDependenciesWithBooleanSubschemasTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Dependencies',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Dependencies'
}

{ #category : 'testing' }
JSONSchemaDependenciesWithBooleanSubschemasTests >> expectedFailures [
	^ #(#testObjectWithBothPropertiesIsInvalid #testObjectWithPropertyHavingSchemaFalseIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaDependenciesWithBooleanSubschemasTests >> schemaString [
	^ '{"dependencies":{"foo":true,"bar":false}}'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithBooleanSubschemasTests >> testEmptyObjectIsValid [
	self assertValid: '{}' description: 'empty object is valid'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithBooleanSubschemasTests >> testObjectWithBothPropertiesIsInvalid [
	self
		assertInvalid: '{"foo":1,"bar":2}'
		description: 'object with both properties is invalid'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithBooleanSubschemasTests >> testObjectWithPropertyHavingSchemaFalseIsInvalid [
	self
		assertInvalid: '{"bar":2}'
		description: 'object with property having schema false is invalid'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithBooleanSubschemasTests >> testObjectWithPropertyHavingSchemaTrueIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'object with property having schema true is valid'
]
