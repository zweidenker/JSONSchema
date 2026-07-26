Class {
	#name : 'JSONSchemaIfWithBooleanSchemaFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaIfWithBooleanSchemaFalseTests >> expectedFailures [
	^ #(#testBooleanSchemaFalseInIfAlwaysChoosesTheElsePathInvalid)
]

{ #category : 'accessing' }
JSONSchemaIfWithBooleanSchemaFalseTests >> schemaString [
	^ '{"else":{"const":"else"},"then":{"const":"then"},"if":false}'
]

{ #category : 'tests' }
JSONSchemaIfWithBooleanSchemaFalseTests >> testBooleanSchemaFalseInIfAlwaysChoosesTheElsePathInvalid [
	self
		assertInvalid: '"then"'
		description: 'boolean schema false in if always chooses the else path (invalid)'
]

{ #category : 'tests' }
JSONSchemaIfWithBooleanSchemaFalseTests >> testBooleanSchemaFalseInIfAlwaysChoosesTheElsePathValid [
	self
		assertValid: '"else"'
		description: 'boolean schema false in if always chooses the else path (valid)'
]
