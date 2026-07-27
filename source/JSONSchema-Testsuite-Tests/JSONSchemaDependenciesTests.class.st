Class {
	#name : 'JSONSchemaDependenciesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Dependencies',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Dependencies'
}

{ #category : 'testing' }
JSONSchemaDependenciesTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaDependenciesTests >> schemaString [
	^ '{"dependencies":{"bar":["foo"]}}'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testIgnoresArrays [
	self assertValid: '["bar"]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testIgnoresStrings [
	self assertValid: '"foobar"' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testMissingDependency [
	self assertInvalid: '{"bar":2}' description: 'missing dependency'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testNeither [
	self assertValid: '{}' description: 'neither'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testNondependant [
	self assertValid: '{"foo":1}' description: 'nondependant'
]

{ #category : 'tests' }
JSONSchemaDependenciesTests >> testWithDependency [
	self assertValid: '{"foo":1,"bar":2}' description: 'with dependency'
]
