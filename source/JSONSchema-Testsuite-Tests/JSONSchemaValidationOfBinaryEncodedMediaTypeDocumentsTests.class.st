Class {
	#name : 'JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Content',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Content'
}

{ #category : 'testing' }
JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests >> expectedFailures [
	^ #(#testAValidlyEncodedInvalidJSONDocument #testAnInvalidBase64StringThatIsValidJSON)
]

{ #category : 'accessing' }
JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests >> schemaString [
	^ '{"contentEncoding":"base64","contentMediaType":"application/json"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests >> testAValidBase64EncodedJSONDocument [
	self
		assertValid: '"eyJmb28iOiAiYmFyIn0K"'
		description: 'a valid base64-encoded JSON document'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests >> testAValidlyEncodedInvalidJSONDocument [
	self
		assertInvalid: '"ezp9Cg=="'
		description: 'a validly-encoded invalid JSON document'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests >> testAnInvalidBase64StringThatIsValidJSON [
	self
		assertInvalid: '"{}"'
		description: 'an invalid base64 string that is valid JSON'
]

{ #category : 'tests' }
JSONSchemaValidationOfBinaryEncodedMediaTypeDocumentsTests >> testIgnoresNonStrings [
	self assertValid: '100' description: 'ignores non-strings'
]
