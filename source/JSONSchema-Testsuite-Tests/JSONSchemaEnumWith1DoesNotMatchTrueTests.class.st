Class {
	#name : 'JSONSchemaEnumWith1DoesNotMatchTrueTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaEnumWith1DoesNotMatchTrueTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaEnumWith1DoesNotMatchTrueTests >> schemaString [
	^ '{"enum":[1]}'
]

{ #category : 'tests' }
JSONSchemaEnumWith1DoesNotMatchTrueTests >> testFloatOneIsValid [
	self assertValid: '1.0' description: 'float one is valid'
]

{ #category : 'tests' }
JSONSchemaEnumWith1DoesNotMatchTrueTests >> testIntegerOneIsValid [
	self assertValid: '1' description: 'integer one is valid'
]

{ #category : 'tests' }
JSONSchemaEnumWith1DoesNotMatchTrueTests >> testTrueIsInvalid [
	self assertInvalid: 'true' description: 'true is invalid'
]
