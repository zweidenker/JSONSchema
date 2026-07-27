Class {
	#name : 'JSONSchemaValidateAgainstCorrectBranchThenVsElseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'accessing' }
JSONSchemaValidateAgainstCorrectBranchThenVsElseTests >> schemaString [
	^ '{"else":{"multipleOf":2},"then":{"minimum":-10},"if":{"exclusiveMaximum":0}}'
]

{ #category : 'tests' }
JSONSchemaValidateAgainstCorrectBranchThenVsElseTests >> testInvalidThroughElse [
	self assertInvalid: '3' description: 'invalid through else'
]

{ #category : 'tests' }
JSONSchemaValidateAgainstCorrectBranchThenVsElseTests >> testInvalidThroughThen [
	self assertInvalid: '-100' description: 'invalid through then'
]

{ #category : 'tests' }
JSONSchemaValidateAgainstCorrectBranchThenVsElseTests >> testValidThroughElse [
	self assertValid: '4' description: 'valid through else'
]

{ #category : 'tests' }
JSONSchemaValidateAgainstCorrectBranchThenVsElseTests >> testValidThroughThen [
	self assertValid: '-1' description: 'valid through then'
]
