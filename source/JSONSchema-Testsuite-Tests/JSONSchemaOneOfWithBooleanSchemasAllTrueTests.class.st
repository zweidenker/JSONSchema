Class {
	#name : 'JSONSchemaOneOfWithBooleanSchemasAllTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithBooleanSchemasAllTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaOneOfWithBooleanSchemasAllTrueTests >> schemaString [
	^ '{"oneOf":[true,true,true]}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBooleanSchemasAllTrueTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
