Class {
	#name : 'JSONSchemaRequiredWithEmptyArrayTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Required',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Required'
}

{ #category : 'testing' }
JSONSchemaRequiredWithEmptyArrayTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaRequiredWithEmptyArrayTests >> schemaString [
	^ '{"properties":{"foo":{}},"required":[]}'
]

{ #category : 'tests' }
JSONSchemaRequiredWithEmptyArrayTests >> testPropertyNotRequired [
	self assertValid: '{}' description: 'property not required'
]
