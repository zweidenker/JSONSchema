Class {
	#name : 'JSONSchemaDependenciesWithEmptyArrayTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Dependencies',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Dependencies'
}

{ #category : 'testing' }
JSONSchemaDependenciesWithEmptyArrayTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaDependenciesWithEmptyArrayTests >> schemaString [
	^ '{"dependencies":{"bar":[]}}'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEmptyArrayTests >> testEmptyObject [
	self assertValid: '{}' description: 'empty object'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEmptyArrayTests >> testNonObjectIsValid [
	self assertValid: '1' description: 'non-object is valid'
]

{ #category : 'tests' }
JSONSchemaDependenciesWithEmptyArrayTests >> testObjectWithOneProperty [
	self assertValid: '{"bar":2}' description: 'object with one property'
]
