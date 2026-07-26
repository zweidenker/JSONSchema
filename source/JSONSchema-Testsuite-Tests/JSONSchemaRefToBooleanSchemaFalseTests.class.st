Class {
	#name : 'JSONSchemaRefToBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRefToBooleanSchemaFalseTests >> expectedFailures [
	^ #(#testAnyValueIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaRefToBooleanSchemaFalseTests >> schemaString [
	^ '{"$ref":"#/definitions/bool","definitions":{"bool":false}}'
]

{ #category : 'tests' }
JSONSchemaRefToBooleanSchemaFalseTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
