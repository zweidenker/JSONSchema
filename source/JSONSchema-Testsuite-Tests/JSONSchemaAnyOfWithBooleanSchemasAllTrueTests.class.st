Class {
	#name : 'JSONSchemaAnyOfWithBooleanSchemasAllTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfWithBooleanSchemasAllTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAnyOfWithBooleanSchemasAllTrueTests >> schemaString [
	^ '{"anyOf":[true,true]}'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithBooleanSchemasAllTrueTests >> testAnyValueIsValid [
	self assertValid: '"foo"' description: 'any value is valid'
]
