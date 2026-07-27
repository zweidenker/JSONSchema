Class {
	#name : 'JSONSchemaAllOfWithBooleanSchemasAllFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithBooleanSchemasAllFalseTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAllOfWithBooleanSchemasAllFalseTests >> schemaString [
	^ '{"allOf":[false,false]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBooleanSchemasAllFalseTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
