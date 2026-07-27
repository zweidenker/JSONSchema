Class {
	#name : 'JSONSchemaAnyOfWithBooleanSchemasSomeTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfWithBooleanSchemasSomeTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaAnyOfWithBooleanSchemasSomeTrueTests >> schemaString [
	^ '{"anyOf":[true,false]}'
]

{ #category : 'tests' }
JSONSchemaAnyOfWithBooleanSchemasSomeTrueTests >> testAnyValueIsValid [
	self assertValid: '"foo"' description: 'any value is valid'
]
