Class {
	#name : 'JSONSchemaDependenciesWithEscapedCharactersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Dependencies',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Dependencies'
}

{ #category : 'testing' }
JSONSchemaDependenciesWithEscapedCharactersTests >> expectedFailures [
	^ #(#testInvalidObject4 #testInvalidObject1 #testInvalidObject2 #testInvalidObject3)
]

{ #category : 'accessing' }
JSONSchemaDependenciesWithEscapedCharactersTests >> schemaString [
	^ '{"dependencies":{"foo''bar":{"required":["foo\"bar"]},"foo\"bar":["foo''bar"],"foo\nbar":["foo\rbar"],"foo\tbar":{"minProperties":4}}}'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testInvalidObject1 [
	self
		assertInvalid: '{"foo":2,"foo\nbar":1}'
		description: 'invalid object 1'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testInvalidObject2 [
	self
		assertInvalid: '{"a":2,"foo\tbar":1}'
		description: 'invalid object 2'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testInvalidObject3 [
	self assertInvalid: '{"foo''bar":1}' description: 'invalid object 3'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testInvalidObject4 [
	self assertInvalid: '{"foo\"bar":2}' description: 'invalid object 4'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testValidObject1 [
	self
		assertValid: '{"foo\nbar":1,"foo\rbar":2}'
		description: 'valid object 1'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testValidObject2 [
	self
		assertValid: '{"c":4,"a":2,"foo\tbar":1,"b":3}'
		description: 'valid object 2'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEscapedCharactersTests >> testValidObject3 [
	self
		assertValid: '{"foo''bar":1,"foo\"bar":2}'
		description: 'valid object 3'
]
