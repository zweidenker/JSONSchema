Class {
	#name : 'JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-JsonPointer',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'JsonPointer'
}

{ #category : 'testing' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> expectedFailures [
	^ #(#testNotAValidJSONPointerURIFragmentIdentifier1 #testNotAValidJSONPointerMultipleCharactersNotEscaped #testNotAValidJSONPointerIsnTEmptyNorStartsWith1 #testValidJSONPointerAsStatedInRFC69014 #testValidJSONPointerMultipleEscapedCharacters #testAValidJSONPointer #testValidJSONPointerAsStatedInRFC690112 #testNotAValidJSONPointerWrongEscapeCharacter2 #testValidJSONPointerUsedAsObjectMemberName #testValidJSONPointerAsStatedInRFC69019 #testValidJSONPointerEscapedWithFractionPart1 #testValidJSONPointerAsStatedInRFC69012 #testNotAValidJSONPointerSomeEscapedButNotAll2 #testValidJSONPointerAsStatedInRFC690110 #testValidJSONPointerWithEmptySegment #testValidJSONPointerWithTheLastEmptySegment #testValidJSONPointerAsStatedInRFC69017 #testNotAValidJSONPointerURIFragmentIdentifier2 #testNotAValidJSONPointerIsnTEmptyNorStartsWith2 #testValidJSONPointerAsStatedInRFC69015 #testNotAValidJSONPointerNotEscaped #testValidJSONPointerEscapedWithFractionPart2 #testValidJSONPointerAsStatedInRFC69013 #testNotAValidJSONPointerWrongEscapeCharacter1 #testValidJSONPointerAsStatedInRFC690111 #testValidJSONPointerAsStatedInRFC69018 #testValidJSONPointerAsStatedInRFC69011 #testNotAValidJSONPointerURIFragmentIdentifier3 #testNotAValidJSONPointerSomeEscapedButNotAll1 #testValidJSONPointerUsedAddingToTheLastArrayPosition #testNotAValidJSONPointerIsnTEmptyNorStartsWith3 #testValidJSONPointerAsStatedInRFC69016)
]

{ #category : 'accessing' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> schemaString [
	^ '{"format":"json-pointer"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testAValidJSONPointer [
	self
		assertValid: '"/foo/bar~0/baz~1/%a"'
		description: 'a valid JSON-pointer'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerIsnTEmptyNorStartsWith1 [
	self
		assertInvalid: '"a"'
		description: 'not a valid JSON-pointer (isn''t empty nor starts with /) #1'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerIsnTEmptyNorStartsWith2 [
	self
		assertInvalid: '"0"'
		description: 'not a valid JSON-pointer (isn''t empty nor starts with /) #2'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerIsnTEmptyNorStartsWith3 [
	self
		assertInvalid: '"a/a"'
		description: 'not a valid JSON-pointer (isn''t empty nor starts with /) #3'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerMultipleCharactersNotEscaped [
	self
		assertInvalid: '"/~~"'
		description: 'not a valid JSON-pointer (multiple characters not escaped)'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerNotEscaped [
	self
		assertInvalid: '"/foo/bar~"'
		description: 'not a valid JSON-pointer (~ not escaped)'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerSomeEscapedButNotAll1 [
	self
		assertInvalid: '"/~0~"'
		description: 'not a valid JSON-pointer (some escaped, but not all) #1'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerSomeEscapedButNotAll2 [
	self
		assertInvalid: '"/~0/~"'
		description: 'not a valid JSON-pointer (some escaped, but not all) #2'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerURIFragmentIdentifier1 [
	self
		assertInvalid: '"#"'
		description: 'not a valid JSON-pointer (URI Fragment Identifier) #1'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerURIFragmentIdentifier2 [
	self
		assertInvalid: '"#/"'
		description: 'not a valid JSON-pointer (URI Fragment Identifier) #2'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerURIFragmentIdentifier3 [
	self
		assertInvalid: '"#a"'
		description: 'not a valid JSON-pointer (URI Fragment Identifier) #3'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerWrongEscapeCharacter1 [
	self
		assertInvalid: '"/~2"'
		description: 'not a valid JSON-pointer (wrong escape character) #1'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testNotAValidJSONPointerWrongEscapeCharacter2 [
	self
		assertInvalid: '"/~-1"'
		description: 'not a valid JSON-pointer (wrong escape character) #2'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69011 [
	self
		assertValid: '""'
		description: 'valid JSON-pointer as stated in RFC 6901 #1'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC690110 [
	self
		assertValid: '"/k\"l"'
		description: 'valid JSON-pointer as stated in RFC 6901 #10'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC690111 [
	self
		assertValid: '"/ "'
		description: 'valid JSON-pointer as stated in RFC 6901 #11'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC690112 [
	self
		assertValid: '"/m~0n"'
		description: 'valid JSON-pointer as stated in RFC 6901 #12'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69012 [
	self
		assertValid: '"/foo"'
		description: 'valid JSON-pointer as stated in RFC 6901 #2'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69013 [
	self
		assertValid: '"/foo/0"'
		description: 'valid JSON-pointer as stated in RFC 6901 #3'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69014 [
	self
		assertValid: '"/"'
		description: 'valid JSON-pointer as stated in RFC 6901 #4'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69015 [
	self
		assertValid: '"/a~1b"'
		description: 'valid JSON-pointer as stated in RFC 6901 #5'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69016 [
	self
		assertValid: '"/c%d"'
		description: 'valid JSON-pointer as stated in RFC 6901 #6'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69017 [
	self
		assertValid: '"/e^f"'
		description: 'valid JSON-pointer as stated in RFC 6901 #7'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69018 [
	self
		assertValid: '"/g|h"'
		description: 'valid JSON-pointer as stated in RFC 6901 #8'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerAsStatedInRFC69019 [
	self
		assertValid: '"/i\\j"'
		description: 'valid JSON-pointer as stated in RFC 6901 #9'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerEscapedWithFractionPart1 [
	self
		assertValid: '"/~1.1"'
		description: 'valid JSON-pointer (escaped with fraction part) #1'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerEscapedWithFractionPart2 [
	self
		assertValid: '"/~0.1"'
		description: 'valid JSON-pointer (escaped with fraction part) #2'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerMultipleEscapedCharacters [
	self
		assertValid: '"/~1~0~0~1~1"'
		description: 'valid JSON-pointer (multiple escaped characters)'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerUsedAddingToTheLastArrayPosition [
	self
		assertValid: '"/foo/-"'
		description: 'valid JSON-pointer used adding to the last array position'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerUsedAsObjectMemberName [
	self
		assertValid: '"/foo/-/bar"'
		description: 'valid JSON-pointer (- used as object member name)'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerWithEmptySegment [
	self
		assertValid: '"/foo//bar"'
		description: 'valid JSON-pointer with empty segment'
]

{ #category : 'tests' }
JSONSchemaValidationOfJSONPointersJSONStringRepresentationTests >> testValidJSONPointerWithTheLastEmptySegment [
	self
		assertValid: '"/foo/bar/"'
		description: 'valid JSON-pointer with the last empty segment'
]
