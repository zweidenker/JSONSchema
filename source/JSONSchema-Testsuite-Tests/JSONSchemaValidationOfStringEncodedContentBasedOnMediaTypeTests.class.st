Class {
	#name : 'JSONSchemaValidationOfStringEncodedContentBasedOnMediaTypeTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Content',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Content'
}

{ #category : 'testing' }
JSONSchemaValidationOfStringEncodedContentBasedOnMediaTypeTests >> expectedFailures [
	^ #(#testAnInvalidJSONDocument)
]

{ #category : 'accessing' }
JSONSchemaValidationOfStringEncodedContentBasedOnMediaTypeTests >> schemaString [
	^ '{"contentMediaType":"application/json"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfStringEncodedContentBasedOnMediaTypeTests >> testAValidJSONDocument [
	self
		assertValid: '"{\"foo\": \"bar\"}"'
		description: 'a valid JSON document'
]

{ #category : 'tests' }
JSONSchemaValidationOfStringEncodedContentBasedOnMediaTypeTests >> testAnInvalidJSONDocument [
	self assertInvalid: '"{:}"' description: 'an invalid JSON document'
]

{ #category : 'tests' }
JSONSchemaValidationOfStringEncodedContentBasedOnMediaTypeTests >> testIgnoresNonStrings [
	self assertValid: '100' description: 'ignores non-strings'
]
