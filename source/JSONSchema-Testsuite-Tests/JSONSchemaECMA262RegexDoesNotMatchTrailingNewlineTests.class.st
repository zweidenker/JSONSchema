Class {
	#name : 'JSONSchemaECMA262RegexDoesNotMatchTrailingNewlineTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262RegexDoesNotMatchTrailingNewlineTests >> expectedFailures [
	^ #(#testMatchesInPythonButShouldNotInJsonschema #testShouldMatch)
]

{ #category : 'accessing' }
JSONSchemaECMA262RegexDoesNotMatchTrailingNewlineTests >> schemaString [
	^ '{"pattern":"^abc$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexDoesNotMatchTrailingNewlineTests >> testMatchesInPythonButShouldNotInJsonschema [
	self
		assertInvalid: '"abc\n"'
		description: 'matches in Python, but should not in jsonschema'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexDoesNotMatchTrailingNewlineTests >> testShouldMatch [
	self assertValid: '"abc"' description: 'should match'
]
