Class {
	#name : 'JSONSchemaIfWithBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'accessing' }
JSONSchemaIfWithBooleanSchemaTrueTests >> schemaString [
	^ '{"else":{"const":"else"},"then":{"const":"then"},"if":true}'
]

{ #category : 'tests' }
JSONSchemaIfWithBooleanSchemaTrueTests >> testBooleanSchemaTrueInIfAlwaysChoosesTheThenPathInvalid [
	self
		assertInvalid: '"else"'
		description: 'boolean schema true in if always chooses the then path (invalid)'
]

{ #category : 'tests' }
JSONSchemaIfWithBooleanSchemaTrueTests >> testBooleanSchemaTrueInIfAlwaysChoosesTheThenPathValid [
	self
		assertValid: '"then"'
		description: 'boolean schema true in if always chooses the then path (valid)'
]
