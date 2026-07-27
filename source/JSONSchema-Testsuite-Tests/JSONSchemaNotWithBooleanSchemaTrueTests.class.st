Class {
	#name : 'JSONSchemaNotWithBooleanSchemaTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Not',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Not'
}

{ #category : 'testing' }
JSONSchemaNotWithBooleanSchemaTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaNotWithBooleanSchemaTrueTests >> schemaString [
	^ '{"not":true}'
]

{ #category : 'tests' }
JSONSchemaNotWithBooleanSchemaTrueTests >> testAnyValueIsInvalid [
	self assertInvalid: '"foo"' description: 'any value is invalid'
]
