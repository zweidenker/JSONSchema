Extension { #name : 'String' }

{ #category : '*jsonschema-core' }
String >> asECMARegex [
	"Pharo's Regex engine doesn't support ECMA-262 non-capturing groups (?:...). They're
	semantically equivalent to a plain capturing group for the match/no-match checks JSON
	Schema patterns need (pattern/patternProperties), so translate before compiling."
	^ (self copyReplaceAll: '(?:' with: '(') asRegex
]

{ #category : '*jsonschema-core' }
String >> asJSONSchema [
	^ JSONSchema string
]
