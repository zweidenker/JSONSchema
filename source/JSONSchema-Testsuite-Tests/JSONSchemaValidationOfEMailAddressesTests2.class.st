Class {
	#name : 'JSONSchemaValidationOfEMailAddressesTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Email',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Email'
}

{ #category : 'accessing' }
JSONSchemaValidationOfEMailAddressesTests2 >> schemaString [
	^ '{"format":"email"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testAValidEMailAddress [
	self
		assertValid: '"joe.bloggs@example.com"'
		description: 'a valid e-mail address'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testAnInvalidEMailAddress [
	self assertInvalid: '"2962"' description: 'an invalid e-mail address'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testDotAfterLocalPartIsNotValid [
	self
		assertInvalid: '"test.@example.com"'
		description: 'dot after local part is not valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testDotBeforeLocalPartIsNotValid [
	self
		assertInvalid: '".test@example.com"'
		description: 'dot before local part is not valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testTildeAfterLocalPartIsValid [
	self
		assertValid: '"test~@example.com"'
		description: 'tilde after local part is valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testTildeBeforeLocalPartIsValid [
	self
		assertValid: '"~test@example.com"'
		description: 'tilde before local part is valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testTildeInLocalPartIsValid [
	self
		assertValid: '"te~st@example.com"'
		description: 'tilde in local part is valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testTwoSeparatedDotsInsideLocalPartAreValid [
	self
		assertValid: '"te.s.t@example.com"'
		description: 'two separated dots inside local part are valid'
]

{ #category : 'tests' }
JSONSchemaValidationOfEMailAddressesTests2 >> testTwoSubsequentDotsInsideLocalPartAreNotValid [
	self
		assertInvalid: '"te..st@example.com"'
		description: 'two subsequent dots inside local part are not valid'
]
