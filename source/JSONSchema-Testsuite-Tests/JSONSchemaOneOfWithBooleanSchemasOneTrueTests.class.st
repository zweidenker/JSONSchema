Class {
	#name : 'JSONSchemaOneOfWithBooleanSchemasOneTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithBooleanSchemasOneTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaOneOfWithBooleanSchemasOneTrueTests >> schemaString [
	^ '{"oneOf":[true,false,false]}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBooleanSchemasOneTrueTests >> testAnyValueIsValid [
	self assertValid: '"foo"' description: 'any value is valid'
]
