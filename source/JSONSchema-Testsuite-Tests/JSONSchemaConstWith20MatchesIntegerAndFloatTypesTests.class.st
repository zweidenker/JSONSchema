Class {
	#name : 'JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests >> schemaString [
	^ '{"const":-2.0}'
]

{ #category : 'tests' }
JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests >> testFloat200001IsInvalid [
	self
		assertInvalid: '-2.00001'
		description: 'float -2.00001 is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests >> testFloat20IsInvalid [
	self assertInvalid: '2.0' description: 'float 2.0 is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests >> testFloat20IsValid [
	self assertValid: '-2.0' description: 'float -2.0 is valid'
]

{ #category : 'tests' }
JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests >> testInteger2IsInvalid [
	self assertInvalid: '2' description: 'integer 2 is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith20MatchesIntegerAndFloatTypesTests >> testInteger2IsValid [
	self assertValid: '-2' description: 'integer -2 is valid'
]
