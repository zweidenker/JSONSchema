Class {
	#name : 'JSONSchemaRequiredWithEscapedCharactersTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Required',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Required'
}

{ #category : 'testing' }
JSONSchemaRequiredWithEscapedCharactersTests >> expectedFailures [
	^ #(#testObjectWithSomePropertiesMissingIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaRequiredWithEscapedCharactersTests >> schemaString [
	^ '{"required":["foo\nbar","foo\"bar","foo\\bar","foo\rbar","foo\tbar","foo\fbar"]}'
]

{ #category : 'tests' }
JSONSchemaRequiredWithEscapedCharactersTests >> testObjectWithAllPropertiesPresentIsValid [
	self
		assertValid:
			'{"foo\"bar":1,"foo\\bar":1,"foo\tbar":1,"foo\nbar":1,"foo\rbar":1,"foo\fbar":1}'
		description: 'object with all properties present is valid'
]

{ #category : 'tests' }
JSONSchemaRequiredWithEscapedCharactersTests >> testObjectWithSomePropertiesMissingIsInvalid [
	self
		assertInvalid: '{"foo\nbar":"1","foo\"bar":"1"}'
		description: 'object with some properties missing is invalid'
]
