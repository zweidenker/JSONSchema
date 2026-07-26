Class {
	#name : 'JSONSchemaIntegerTypeMatchesIntegersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Type',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Type'
}

{ #category : 'testing' }
JSONSchemaIntegerTypeMatchesIntegersTests >> expectedFailures [
	^ #(#testAFloatWithZeroFractionalPartIsAnInteger)
]

{ #category : 'accessing' }
JSONSchemaIntegerTypeMatchesIntegersTests >> schemaString [
	^ '{"type":"integer"}'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testABooleanIsNotAnInteger [
	self assertInvalid: 'true' description: 'a boolean is not an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAFloatIsNotAnInteger [
	self assertInvalid: '1.1' description: 'a float is not an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAFloatWithZeroFractionalPartIsAnInteger [
	self
		assertValid: '1.0'
		description: 'a float with zero fractional part is an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAStringIsNotAnInteger [
	self assertInvalid: '"foo"' description: 'a string is not an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAStringIsStillNotAnIntegerEvenIfItLooksLikeOne [
	self
		assertInvalid: '"1"'
		description: 'a string is still not an integer, even if it looks like one'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAnArrayIsNotAnInteger [
	self assertInvalid: '[]' description: 'an array is not an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAnIntegerIsAnInteger [
	self assertValid: '1' description: 'an integer is an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testAnObjectIsNotAnInteger [
	self assertInvalid: '{}' description: 'an object is not an integer'
]

{ #category : 'tests' }
JSONSchemaIntegerTypeMatchesIntegersTests >> testNullIsNotAnInteger [
	self assertInvalid: 'null' description: 'null is not an integer'
]
