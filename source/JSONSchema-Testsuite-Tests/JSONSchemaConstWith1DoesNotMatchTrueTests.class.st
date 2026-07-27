Class {
	#name : 'JSONSchemaConstWith1DoesNotMatchTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaConstWith1DoesNotMatchTrueTests >> schemaString [
	^ '{"const":1}'
]

{ #category : 'tests' }
JSONSchemaConstWith1DoesNotMatchTrueTests >> testFloatOneIsValid [
	self assertValid: '1.0' description: 'float one is valid'
]

{ #category : 'tests' }
JSONSchemaConstWith1DoesNotMatchTrueTests >> testIntegerOneIsValid [
	self assertValid: '1' description: 'integer one is valid'
]

{ #category : 'tests' }
JSONSchemaConstWith1DoesNotMatchTrueTests >> testTrueIsInvalid [
	self assertInvalid: 'true' description: 'true is invalid'
]
