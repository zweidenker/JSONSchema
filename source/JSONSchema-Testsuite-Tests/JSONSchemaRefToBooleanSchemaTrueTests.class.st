Class {
	#name : 'JSONSchemaRefToBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRefToBooleanSchemaTrueTests >> expectedFailures [
	^ #(#testAnyValueIsValid)
]

{ #category : 'accessing' }
JSONSchemaRefToBooleanSchemaTrueTests >> schemaString [
	^ '{"$ref":"#/definitions/bool","definitions":{"bool":true}}'
]

{ #category : 'tests' }
JSONSchemaRefToBooleanSchemaTrueTests >> testAnyValueIsValid [
	self assertValid: '"foo"' description: 'any value is valid'
]
