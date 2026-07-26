Class {
	#name : 'JSONSchemaAllOfWithBooleanSchemasAllTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithBooleanSchemasAllTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfWithBooleanSchemasAllTrueTests >> schemaString [
	^ '{"allOf":[true,true]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBooleanSchemasAllTrueTests >> testAnyValueIsValid [
	self assertValid: '"foo"' description: 'any value is valid'
]
