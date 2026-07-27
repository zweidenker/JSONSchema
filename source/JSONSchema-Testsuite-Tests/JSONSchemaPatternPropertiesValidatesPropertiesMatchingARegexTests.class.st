Class {
	#name : 'JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PatternProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PatternProperties'
}

{ #category : 'accessing' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> schemaString [
	^ '{"patternProperties":{"f.*o":{"type":"integer"}}}'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testASingleInvalidMatchIsInvalid [
	self
		assertInvalid: '{"fooooo":2,"foo":"bar"}'
		description: 'a single invalid match is invalid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testASingleValidMatchIsValid [
	self
		assertValid: '{"foo":1}'
		description: 'a single valid match is valid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testIgnoresArrays [
	self assertValid: '["foo"]' description: 'ignores arrays'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testIgnoresOtherNonObjects [
	self assertValid: '12' description: 'ignores other non-objects'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testIgnoresStrings [
	self assertValid: '"foo"' description: 'ignores strings'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testMultipleInvalidMatchesIsInvalid [
	self
		assertInvalid: '{"foo":"bar","foooooo":"baz"}'
		description: 'multiple invalid matches is invalid'
]

{ #category : 'tests' }
JSONSchemaPatternPropertiesValidatesPropertiesMatchingARegexTests >> testMultipleValidMatchesIsValid [
	self
		assertValid: '{"foo":1,"foooooo":2}'
		description: 'multiple valid matches is valid'
]
