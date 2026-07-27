Class {
	#name : 'JSONSchemaValidationOfURIReferencesTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UriReference',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UriReference'
}

{ #category : 'testing' }
JSONSchemaValidationOfURIReferencesTests2 >> expectedFailures [
	^ #(#testAnInvalidURIFragment #testAnInvalidURIReference)
]

{ #category : 'accessing' }
JSONSchemaValidationOfURIReferencesTests2 >> schemaString [
	^ '{"format":"uri-reference"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAValidProtocolRelativeURIReference [
	self
		assertValid: '"//foo.bar/?baz=qux#quux"'
		description: 'a valid protocol-relative URI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAValidRelativeURIReference [
	self
		assertValid: '"/abc"'
		description: 'a valid relative URI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAValidURI [
	self
		assertValid: '"http://foo.bar/?baz=qux#quux"'
		description: 'a valid URI'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAValidURIFragment [
	self assertValid: '"#fragment"' description: 'a valid URI fragment'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAValidURIReference [
	self assertValid: '"abc"' description: 'a valid URI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAnInvalidURIFragment [
	self
		assertInvalid: '"#frag\\ment"'
		description: 'an invalid URI fragment'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIReferencesTests2 >> testAnInvalidURIReference [
	self
		assertInvalid: '"\\\\WINDOWS\\fileshare"'
		description: 'an invalid URI Reference'
]
