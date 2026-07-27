Class {
	#name : 'JSONSchemaMultipleDependenciesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Dependencies',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Dependencies'
}

{ #category : 'accessing' }
JSONSchemaMultipleDependenciesTests >> schemaString [
	^ '{"dependencies":{"quux":["foo","bar"]}}'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesTests >> testMissingBothDependencies [
	self
		assertInvalid: '{"quux":1}'
		description: 'missing both dependencies'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesTests >> testMissingDependency [
	self
		assertInvalid: '{"quux":2,"foo":1}'
		description: 'missing dependency'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesTests >> testMissingOtherDependency [
	self
		assertInvalid: '{"quux":2,"bar":1}'
		description: 'missing other dependency'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesTests >> testNeither [
	self assertValid: '{}' description: 'neither'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesTests >> testNondependants [
	self assertValid: '{"foo":1,"bar":2}' description: 'nondependants'
]

{ #category : 'tests' }
JSONSchemaMultipleDependenciesTests >> testWithDependencies [
	self
		assertValid: '{"quux":3,"foo":1,"bar":2}'
		description: 'with dependencies'
]
