Class {
	#name : 'JSONSchemaOneOfWithBooleanSchemasMoreThanOneTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithBooleanSchemasMoreThanOneTrueTests >> expectedFailures [
	^ #(#testAnyValueIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaOneOfWithBooleanSchemasMoreThanOneTrueTests >> schemaString [
	^ '{"oneOf":[true,true,false]}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBooleanSchemasMoreThanOneTrueTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
