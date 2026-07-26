Class {
	#name : 'JSONSchemaAnyOfWithBooleanSchemasAllFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfWithBooleanSchemasAllFalseTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAnyOfWithBooleanSchemasAllFalseTests >> schemaString [
	^ '{"anyOf":[false,false]}'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithBooleanSchemasAllFalseTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
