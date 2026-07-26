Class {
	#name : 'JSONSchemaPropertiesWithEscapedCharactersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Properties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Properties'
}

{ #category : 'testing' }
JSONSchemaPropertiesWithEscapedCharactersTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaPropertiesWithEscapedCharactersTests >> schemaString [
	^ '{"properties":{"foo\"bar":{"type":"number"},"foo\\bar":{"type":"number"},"foo\tbar":{"type":"number"},"foo\nbar":{"type":"number"},"foo\rbar":{"type":"number"},"foo\fbar":{"type":"number"}}}'
]

{ #category : 'tests' }
JSONSchemaPropertiesWithEscapedCharactersTests >> testObjectWithAllNumbersIsValid [
	self
		assertValid:
			'{"foo\"bar":1,"foo\\bar":1,"foo\tbar":1,"foo\nbar":1,"foo\rbar":1,"foo\fbar":1}'
		description: 'object with all numbers is valid'
]

{ #category : 'tests' }
JSONSchemaPropertiesWithEscapedCharactersTests >> testObjectWithStringsIsInvalid [
	self
		assertInvalid:
			'{"foo\"bar":"1","foo\\bar":"1","foo\tbar":"1","foo\nbar":"1","foo\rbar":"1","foo\fbar":"1"}'
		description: 'object with strings is invalid'
]
