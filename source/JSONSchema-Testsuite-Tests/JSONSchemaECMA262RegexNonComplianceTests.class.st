Class {
	#name : 'JSONSchemaECMA262RegexNonComplianceTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262RegexNonComplianceTests >> expectedFailures [
	^ #(#testECMA262HasNoSupportForZAnchorFromNET)
]

{ #category : 'accessing' }
JSONSchemaECMA262RegexNonComplianceTests >> schemaString [
	^ '{"format":"regex"}'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexNonComplianceTests >> testECMA262HasNoSupportForZAnchorFromNET [
	self
		assertInvalid: '"^\\S(|(.|\\n)*\\S)\\Z"'
		description: 'ECMA 262 has no support for \Z anchor from .NET'
]
