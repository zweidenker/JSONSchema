Class {
	#name : 'JSONSchemaByIntTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-MultipleOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'MultipleOf'
}

{ #category : 'testing' }
JSONSchemaByIntTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaByIntTests >> schemaString [
	^ '{"multipleOf":2}'
]

{ #category : 'tests' }
JSONSchemaByIntTests >> testIgnoresNonNumbers [
	self assertValid: '"foo"' description: 'ignores non-numbers'
]

{ #category : 'tests' }
JSONSchemaByIntTests >> testIntByInt [
	self assertValid: '10' description: 'int by int'
]

{ #category : 'tests' }
JSONSchemaByIntTests >> testIntByIntFail [
	self assertInvalid: '7' description: 'int by int fail'
]
