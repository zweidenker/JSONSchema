Class {
	#name : 'JSONSchemaEnumWithEscapedCharactersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaEnumWithEscapedCharactersTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaEnumWithEscapedCharactersTests >> schemaString [
	^ '{"enum":["foo\nbar","foo\rbar"]}'
]

{ #category : 'tests' }
JSONSchemaEnumWithEscapedCharactersTests >> testAnotherStringIsInvalid [
	self assertInvalid: '"abc"' description: 'another string is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumWithEscapedCharactersTests >> testMember1IsValid [
	self assertValid: '"foo\nbar"' description: 'member 1 is valid'
]

{ #category : 'tests' }
JSONSchemaEnumWithEscapedCharactersTests >> testMember2IsValid [
	self assertValid: '"foo\rbar"' description: 'member 2 is valid'
]
