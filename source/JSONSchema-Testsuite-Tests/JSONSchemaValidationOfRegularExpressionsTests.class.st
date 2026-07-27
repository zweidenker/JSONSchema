Class {
	#name : 'JSONSchemaValidationOfRegularExpressionsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Regex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Regex'
}

{ #category : 'accessing' }
JSONSchemaValidationOfRegularExpressionsTests >> schemaString [
	^ '{"format":"regex"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegularExpressionsTests >> testARegularExpressionWithUnclosedParensIsInvalid [
	self
		assertInvalid: '"^(abc]"'
		description: 'a regular expression with unclosed parens is invalid'
]

{ #category : 'tests' }
JSONSchemaValidationOfRegularExpressionsTests >> testAValidRegularExpression [
	self
		assertValid: '"([abc])+\\s+$"'
		description: 'a valid regular expression'
]
