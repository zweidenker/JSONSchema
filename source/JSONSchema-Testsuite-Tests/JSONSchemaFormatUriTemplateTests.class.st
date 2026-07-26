Class {
	#name : 'JSONSchemaFormatUriTemplateTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UriTemplate',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UriTemplate'
}

{ #category : 'testing' }
JSONSchemaFormatUriTemplateTests >> expectedFailures [
	^ #(#testAValidUriTemplate #testAValidRelativeUriTemplate #testAValidUriTemplateWithoutVariables #testAnInvalidUriTemplate)
]

{ #category : 'accessing' }
JSONSchemaFormatUriTemplateTests >> schemaString [
	^ '{"format":"uri-template"}'
]

{ #category : 'tests' }
JSONSchemaFormatUriTemplateTests >> testAValidRelativeUriTemplate [
	self
		assertValid: '"dictionary/{term:1}/{term}"'
		description: 'a valid relative uri-template'
]

{ #category : 'tests' }
JSONSchemaFormatUriTemplateTests >> testAValidUriTemplate [
	self
		assertValid: '"http://example.com/dictionary/{term:1}/{term}"'
		description: 'a valid uri-template'
]

{ #category : 'tests' }
JSONSchemaFormatUriTemplateTests >> testAValidUriTemplateWithoutVariables [
	self
		assertValid: '"http://example.com/dictionary"'
		description: 'a valid uri-template without variables'
]

{ #category : 'tests' }
JSONSchemaFormatUriTemplateTests >> testAnInvalidUriTemplate [
	self
		assertInvalid: '"http://example.com/dictionary/{term:1}/{term"'
		description: 'an invalid uri-template'
]
