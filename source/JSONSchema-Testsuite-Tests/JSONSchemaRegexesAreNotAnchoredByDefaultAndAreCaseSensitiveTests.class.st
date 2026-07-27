Class {
	#name : 'JSONSchemaRegexesAreNotAnchoredByDefaultAndAreCaseSensitiveTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PatternProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PatternProperties'
}

{ #category : 'accessing' }
JSONSchemaRegexesAreNotAnchoredByDefaultAndAreCaseSensitiveTests >> schemaString [
	^ '{"patternProperties":{"[0-9]{2,}":{"type":"boolean"},"X_":{"type":"string"}}}'
]

{ #category : 'tests' }
JSONSchemaRegexesAreNotAnchoredByDefaultAndAreCaseSensitiveTests >> testNonRecognizedMembersAreIgnored [
	self
		assertValid: '{"answer 1":"42"}'
		description: 'non recognized members are ignored'
]

{ #category : 'tests' }
JSONSchemaRegexesAreNotAnchoredByDefaultAndAreCaseSensitiveTests >> testRecognizedMembersAreAccountedFor [
	self
		assertInvalid: '{"a31b":null}'
		description: 'recognized members are accounted for'
]

{ #category : 'tests' }
JSONSchemaRegexesAreNotAnchoredByDefaultAndAreCaseSensitiveTests >> testRegexesAreCaseSensitive [
	self
		assertValid: '{"a_x_3":3}'
		description: 'regexes are case sensitive'
]

{ #category : 'tests' }
JSONSchemaRegexesAreNotAnchoredByDefaultAndAreCaseSensitiveTests >> testRegexesAreCaseSensitive2 [
	self
		assertInvalid: '{"a_X_3":3}'
		description: 'regexes are case sensitive, 2'
]
