Class {
	#name : 'JSONSchemaIfAndThenWithoutElseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaIfAndThenWithoutElseTests >> expectedFailures [
	^ #(#testInvalidThroughThen)
]

{ #category : 'accessing' }
JSONSchemaIfAndThenWithoutElseTests >> schemaString [
	^ '{"then":{"minimum":-10},"if":{"exclusiveMaximum":0}}'
]

{ #category : 'tests' }
JSONSchemaIfAndThenWithoutElseTests >> testInvalidThroughThen [
	self assertInvalid: '-100' description: 'invalid through then'
]

{ #category : 'tests' }
JSONSchemaIfAndThenWithoutElseTests >> testValidThroughThen [
	self assertValid: '-1' description: 'valid through then'
]

{ #category : 'tests' }
JSONSchemaIfAndThenWithoutElseTests >> testValidWhenIfTestFails [
	self assertValid: '3' description: 'valid when if test fails'
]
