Extension { #name : 'String' }

{ #category : '*jsonschema-core' }
String >> asECMARegex [
	"Pharo's Regex engine doesn't accept some ECMA-262 syntax that real-world schemas use
	(e.g. the OAI OpenAPI meta-schema), even though it is semantically equivalent for the
	boolean match/no-match checks pattern/patternProperties need:
	- non-capturing groups (?:...) - rewritten to a plain capturing group (...)
	- an escaped literal dot \. inside a character class [...] - rewritten to a bare . (both
	  mean 'literal dot' inside a class; Pharo's engine only accepts the unescaped form there)"
	^ self asECMARegexSource asRegex
]

{ #category : '*jsonschema-core' }
String >> asECMARegexSource [
	"See #asECMARegex. Kept separate so the rewritten source itself is testable/inspectable."
	| source result inClass i char |
	source := self copyReplaceAll: '(?:' with: '('.
	result := WriteStream on: String new.
	i := 1.
	inClass := false.
	[ i <= source size ] whileTrue: [
		char := source at: i.
		(char == $[ and: [ inClass not ]) ifTrue: [ inClass := true ].
		(char == $] and: [ inClass ]) ifTrue: [ inClass := false ].
		(inClass and: [ char == $\ and: [ i < source size and: [ (source at: i + 1) == $. ] ] ])
			ifTrue: [ result nextPut: $.. i := i + 2 ]
			ifFalse: [ result nextPut: char. i := i + 1 ] ].
	^ result contents
]

{ #category : '*jsonschema-core' }
String >> asJSONSchema [
	^ JSONSchema string
]
