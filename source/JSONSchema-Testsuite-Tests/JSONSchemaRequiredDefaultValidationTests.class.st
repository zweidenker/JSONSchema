Class {
	#name : 'JSONSchemaRequiredDefaultValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Required',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Required'
}

{ #category : 'testing' }
JSONSchemaRequiredDefaultValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaRequiredDefaultValidationTests >> schemaString [
	^ '{"properties":{"foo":{}}}'
]

{ #category : 'tests' }
JSONSchemaRequiredDefaultValidationTests >> testNotRequiredByDefault [
	self assertValid: '{}' description: 'not required by default'
]
