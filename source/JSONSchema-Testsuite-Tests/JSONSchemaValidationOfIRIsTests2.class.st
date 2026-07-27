Class {
	#name : 'JSONSchemaValidationOfIRIsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Iri',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Iri'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIRIsTests2 >> schemaString [
	^ '{"format":"iri"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAValidIRIBasedOnIPv6 [
	self
		assertValid: '"http://[2001:0db8:85a3:0000:0000:8a2e:0370:7334]"'
		description: 'a valid IRI based on IPv6'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAValidIRIWithAnchorTag [
	self
		assertValid: '"http://ƒøø.ßår/?∂éœ=πîx#πîüx"'
		description: 'a valid IRI with anchor tag'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAValidIRIWithAnchorTagAndParantheses [
	self
		assertValid: '"http://ƒøø.com/blah_(wîkïpédiå)_blah#ßité-1"'
		description: 'a valid IRI with anchor tag and parantheses'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAValidIRIWithManySpecialCharacters [
	self
		assertValid: '"http://-.~_!$&''()*+,;=:%40:80%2f::::::@example.com"'
		description: 'a valid IRI with many special characters'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAValidIRIWithURLEncodedStuff [
	self
		assertValid: '"http://ƒøø.ßår/?q=Test%20URL-encoded%20stuff"'
		description: 'a valid IRI with URL-encoded stuff'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAnInvalidIRI [
	self
		assertInvalid: '"\\\\WINDOWS\\filëßåré"'
		description: 'an invalid IRI'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAnInvalidIRIBasedOnIPv6 [
	self
		assertInvalid: '"http://2001:0db8:85a3:0000:0000:8a2e:0370:7334"'
		description: 'an invalid IRI based on IPv6'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAnInvalidIRIThoughValidIRIReference [
	self
		assertInvalid: '"âππ"'
		description: 'an invalid IRI though valid IRI reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIsTests2 >> testAnInvalidRelativeIRIReference [
	self
		assertInvalid: '"/abc"'
		description: 'an invalid relative IRI Reference'
]
