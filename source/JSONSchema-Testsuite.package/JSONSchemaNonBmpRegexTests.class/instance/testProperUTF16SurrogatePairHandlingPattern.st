as yet unclassified
testProperUTF16SurrogatePairHandlingPattern
	"Proper UTF-16 surrogate pair handling: pattern"

	| schema data |
	schema := JSONSchema fromString: '{"pattern":"^🐲*$"}'.
	"matches empty"
	data := NeoJSONReader fromString: '""'.
	schema validate: data.
	"matches single"
	data := NeoJSONReader fromString: '"🐲"'.
	schema validate: data.
	"matches two"
	data := NeoJSONReader fromString: '"🐲🐲"'.
	schema validate: data.
	"doesn't match one"
	data := NeoJSONReader fromString: '"🐉"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"doesn't match two"
	data := NeoJSONReader fromString: '"🐉🐉"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"doesn't match one ASCII"
	data := NeoJSONReader fromString: '"D"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"doesn't match two ASCII"
	data := NeoJSONReader fromString: '"DD"'.
	self should: [ schema validate: data ] raise: JSONSchemaError