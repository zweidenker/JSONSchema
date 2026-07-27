Class {
	#name : 'JSONSchemaValidationOfIRIReferencesTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IriReference',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IriReference'
}

{ #category : 'accessing' }
JSONSchemaValidationOfIRIReferencesTests2 >> schemaString [
	^ '{"format":"iri-reference"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAValidIRI [
	self
		assertValid: '"http://ƒøø.ßår/?∂éœ=πîx#πîüx"'
		description: 'a valid IRI'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAValidIRIFragment [
	self assertValid: '"#ƒrägmênt"' description: 'a valid IRI fragment'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAValidIRIReference [
	self assertValid: '"âππ"' description: 'a valid IRI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAValidProtocolRelativeIRIReference [
	self
		assertValid: '"//ƒøø.ßår/?∂éœ=πîx#πîüx"'
		description: 'a valid protocol-relative IRI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAValidRelativeIRIReference [
	self
		assertValid: '"/âππ"'
		description: 'a valid relative IRI Reference'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAnInvalidIRIFragment [
	self
		assertInvalid: '"#ƒräg\\mênt"'
		description: 'an invalid IRI fragment'
]

{ #category : 'tests' }
JSONSchemaValidationOfIRIReferencesTests2 >> testAnInvalidIRIReference [
	self
		assertInvalid: '"\\\\WINDOWS\\filëßåré"'
		description: 'an invalid IRI Reference'
]
