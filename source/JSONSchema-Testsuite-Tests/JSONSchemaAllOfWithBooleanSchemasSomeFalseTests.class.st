Class {
	#name : 'JSONSchemaAllOfWithBooleanSchemasSomeFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithBooleanSchemasSomeFalseTests >> expectedFailures [
	^ #(#testAnyValueIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaAllOfWithBooleanSchemasSomeFalseTests >> schemaString [
	^ '{"allOf":[true,false]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithBooleanSchemasSomeFalseTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
