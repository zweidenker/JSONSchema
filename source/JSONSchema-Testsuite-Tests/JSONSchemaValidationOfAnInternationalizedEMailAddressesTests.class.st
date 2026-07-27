Class {
	#name : 'JSONSchemaValidationOfAnInternationalizedEMailAddressesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IdnEmail',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IdnEmail'
}

{ #category : 'accessing' }
JSONSchemaValidationOfAnInternationalizedEMailAddressesTests >> schemaString [
	^ '{"format":"idn-email"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfAnInternationalizedEMailAddressesTests >> testAValidEMailAddress [
	self
		assertValid: '"joe.bloggs@example.com"'
		description: 'a valid e-mail address'
]

{ #category : 'tests' }
JSONSchemaValidationOfAnInternationalizedEMailAddressesTests >> testAValidIdnEMailExampleExampleTestInHangul [
	self
		assertValid: '"실례@실례.테스트"'
		description: 'a valid idn e-mail (example@example.test in Hangul)'
]

{ #category : 'tests' }
JSONSchemaValidationOfAnInternationalizedEMailAddressesTests >> testAnInvalidEMailAddress [
	self assertInvalid: '"2962"' description: 'an invalid e-mail address'
]

{ #category : 'tests' }
JSONSchemaValidationOfAnInternationalizedEMailAddressesTests >> testAnInvalidIdnEMailAddress [
	self
		assertInvalid: '"2962"'
		description: 'an invalid idn e-mail address'
]
