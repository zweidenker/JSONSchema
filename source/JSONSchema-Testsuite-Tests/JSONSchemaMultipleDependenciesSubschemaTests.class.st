Class {
	#name : 'JSONSchemaMultipleDependenciesSubschemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Dependencies',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Dependencies'
}

{ #category : 'accessing' }
JSONSchemaMultipleDependenciesSubschemaTests >> schemaString [
	^ '{"dependencies":{"bar":{"properties":{"foo":{"type":"integer"},"bar":{"type":"integer"}}}}}'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesSubschemaTests >> testNoDependency [
	self assertValid: '{"foo":"quux"}' description: 'no dependency'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesSubschemaTests >> testValid [
	self assertValid: '{"foo":1,"bar":2}' description: 'valid'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesSubschemaTests >> testWrongType [
	self
		assertInvalid: '{"foo":"quux","bar":2}'
		description: 'wrong type'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesSubschemaTests >> testWrongTypeBoth [
	self
		assertInvalid: '{"foo":"quux","bar":"quux"}'
		description: 'wrong type both'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesSubschemaTests >> testWrongTypeOther [
	self
		assertInvalid: '{"foo":2,"bar":"quux"}'
		description: 'wrong type other'
]
