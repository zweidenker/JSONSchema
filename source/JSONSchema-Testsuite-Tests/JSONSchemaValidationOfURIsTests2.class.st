Class {
	#name : 'JSONSchemaValidationOfURIsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Uri',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Uri'
}

{ #category : 'testing' }
JSONSchemaValidationOfURIsTests2 >> expectedFailures [
	^ #(#testAnInvalidURIWithSpaces #testAnInvalidRelativeURIReference #testAnInvalidProtocolRelativeURIReference #testAnInvalidURIThoughValidURIReference #testAnInvalidURIWithCommaInScheme #testAnInvalidURI #testAnInvalidURIWithSpacesAndMissingScheme)
]

{ #category : 'accessing' }
JSONSchemaValidationOfURIsTests2 >> schemaString [
	^ '{"format":"uri"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidMailtoURI [
	self
		assertValid: '"mailto:John.Doe@example.com"'
		description: 'a valid mailto URI'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidNewsgroupURI [
	self
		assertValid: '"news:comp.infosystems.www.servers.unix"'
		description: 'a valid newsgroup URI'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidPunyCodedURL [
	self
		assertValid: '"http://xn--nw2a.xn--j6w193g/"'
		description: 'a valid puny-coded URL '
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidTelURI [
	self
		assertValid: '"tel:+1-816-555-1212"'
		description: 'a valid tel URI'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURL [
	self
		assertValid: '"ldap://[2001:db8::7]/c=GB?objectClass?one"'
		description: 'a valid URL '
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLBasedOnIPv4 [
	self
		assertValid: '"http://223.255.255.254"'
		description: 'a valid URL based on IPv4'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLForASimpleTextFile [
	self
		assertValid: '"http://www.ietf.org/rfc/rfc2396.txt"'
		description: 'a valid URL for a simple text file'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLWithAnchorTag [
	self
		assertValid: '"http://foo.bar/?baz=qux#quux"'
		description: 'a valid URL with anchor tag'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLWithAnchorTagAndParantheses [
	self
		assertValid: '"http://foo.com/blah_(wikipedia)_blah#cite-1"'
		description: 'a valid URL with anchor tag and parantheses'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLWithFtpScheme [
	self
		assertValid: '"ftp://ftp.is.co.za/rfc/rfc1808.txt"'
		description: 'a valid URL with ftp scheme'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLWithManySpecialCharacters [
	self
		assertValid: '"http://-.~_!$&''()*+,;=:%40:80%2f::::::@example.com"'
		description: 'a valid URL with many special characters'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURLWithURLEncodedStuff [
	self
		assertValid: '"http://foo.bar/?q=Test%20URL-encoded%20stuff"'
		description: 'a valid URL with URL-encoded stuff'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAValidURN [
	self
		assertValid: '"urn:oasis:names:specification:docbook:dtd:xml:4.1.2"'
		description: 'a valid URN'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidProtocolRelativeURIReference [
	self
		assertInvalid: '"//foo.bar/?baz=qux#quux"'
		description: 'an invalid protocol-relative URI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidRelativeURIReference [
	self
		assertInvalid: '"/abc"'
		description: 'an invalid relative URI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidURI [
	self
		assertInvalid: '"\\\\WINDOWS\\fileshare"'
		description: 'an invalid URI'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidURIThoughValidURIReference [
	self
		assertInvalid: '"abc"'
		description: 'an invalid URI though valid URI reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidURIWithCommaInScheme [
	self
		assertInvalid: '"bar,baz:foo"'
		description: 'an invalid URI with comma in scheme'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidURIWithSpaces [
	self
		assertInvalid: '"http:// shouldfail.com"'
		description: 'an invalid URI with spaces'
]

{ #category : 'tests' }
JSONSchemaValidationOfURIsTests2 >> testAnInvalidURIWithSpacesAndMissingScheme [
	self
		assertInvalid: '":// should fail"'
		description: 'an invalid URI with spaces and missing scheme'
]
