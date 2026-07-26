Class {
	#name : 'JSONSchemaIfAndElseWithoutThenTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaIfAndElseWithoutThenTests >> expectedFailures [
	^ #(#testInvalidThroughElse)
]

{ #category : 'accessing' }
JSONSchemaIfAndElseWithoutThenTests >> schemaString [
	^ '{"else":{"multipleOf":2},"if":{"exclusiveMaximum":0}}'
]

{ #category : 'tests' }
JSONSchemaIfAndElseWithoutThenTests >> testInvalidThroughElse [
	self assertInvalid: '3' description: 'invalid through else'
]

{ #category : 'tests' }
JSONSchemaIfAndElseWithoutThenTests >> testValidThroughElse [
	self assertValid: '4' description: 'valid through else'
]

{ #category : 'tests' }
JSONSchemaIfAndElseWithoutThenTests >> testValidWhenIfTestPasses [
	self assertValid: '-1' description: 'valid when if test passes'
]
