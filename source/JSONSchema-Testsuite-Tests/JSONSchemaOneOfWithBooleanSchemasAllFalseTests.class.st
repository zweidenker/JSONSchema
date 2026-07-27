Class {
	#name : 'JSONSchemaOneOfWithBooleanSchemasAllFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-OneOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'OneOf'
}

{ #category : 'testing' }
JSONSchemaOneOfWithBooleanSchemasAllFalseTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaOneOfWithBooleanSchemasAllFalseTests >> schemaString [
	^ '{"oneOf":[false,false,false]}'
]

{ #category : 'tests' }
JSONSchemaOneOfWithBooleanSchemasAllFalseTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
