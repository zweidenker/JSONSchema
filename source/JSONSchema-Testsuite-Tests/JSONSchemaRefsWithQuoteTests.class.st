Class {
	#name : 'JSONSchemaRefsWithQuoteTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRefsWithQuoteTests >> expectedFailures [
	^ #(#testObjectWithStringsIsInvalid #testObjectWithNumbersIsValid)
]

{ #category : 'accessing' }
JSONSchemaRefsWithQuoteTests >> schemaString [
	^ '{"definitions":{"foo\"bar":{"type":"number"}},"properties":{"foo\"bar":{"$ref":"#/definitions/foo%22bar"}}}'
]

{ #category : 'tests' }
JSONSchemaRefsWithQuoteTests >> testObjectWithNumbersIsValid [
	self
		assertValid: '{"foo\"bar":1}'
		description: 'object with numbers is valid'
]

{ #category : 'tests' }
JSONSchemaRefsWithQuoteTests >> testObjectWithStringsIsInvalid [
	self
		assertInvalid: '{"foo\"bar":"1"}'
		description: 'object with strings is invalid'
]
