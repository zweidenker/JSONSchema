Class {
	#name : 'JSONSchemaValidationOfBinaryStringEncodingTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Content',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Content'
}

{ #category : 'testing' }
JSONSchemaValidationOfBinaryStringEncodingTests >> expectedFailures [
	^ #(#testAnInvalidBase64StringIsNotAValidCharacter)
]

{ #category : 'accessing' }
JSONSchemaValidationOfBinaryStringEncodingTests >> schemaString [
	^ '{"contentEncoding":"base64"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryStringEncodingTests >> testAValidBase64String [
	self
		assertValid: '"eyJmb28iOiAiYmFyIn0K"'
		description: 'a valid base64 string'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryStringEncodingTests >> testAnInvalidBase64StringIsNotAValidCharacter [
	self
		assertInvalid: '"eyJmb28iOi%iYmFyIn0K"'
		description: 'an invalid base64 string (% is not a valid character)'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryStringEncodingTests >> testIgnoresNonStrings [
	self assertValid: '100' description: 'ignores non-strings'
]
