Class {
	#name : 'JSONSchemaAnyOfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AnyOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AnyOf'
}

{ #category : 'testing' }
JSONSchemaAnyOfTests >> expectedFailures [
	^ #(#testSecondAnyOfValid #testBothAnyOfValid #testNeitherAnyOfValid #testFirstAnyOfValid)
]

{ #category : 'accessing' }
JSONSchemaAnyOfTests >> schemaString [
	^ '{"anyOf":[{"type":"integer"},{"minimum":2}]}'
]

{ #category : 'tests' }
JSONSchemaAnyOfTests >> testBothAnyOfValid [
	self assertValid: '3' description: 'both anyOf valid'
]

{ #category : 'tests' }
JSONSchemaAnyOfTests >> testFirstAnyOfValid [
	self assertValid: '1' description: 'first anyOf valid'
]

{ #category : 'tests' }
JSONSchemaAnyOfTests >> testNeitherAnyOfValid [
	self assertInvalid: '1.5' description: 'neither anyOf valid'
]

{ #category : 'tests' }
JSONSchemaAnyOfTests >> testSecondAnyOfValid [
	self assertValid: '2.5' description: 'second anyOf valid'
]
