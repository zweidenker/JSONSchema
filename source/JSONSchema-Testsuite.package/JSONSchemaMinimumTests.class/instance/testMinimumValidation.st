as yet unclassified
testMinimumValidation
	"minimum validation"

	| schema data |
	schema := JSONSchema fromString: '{"minimum":1.1}'.
	"above the minimum is valid"
	data := NeoJSONReader fromString: '2.6'.
	schema validate: data.
	"boundary point is valid"
	data := NeoJSONReader fromString: '1.1'.
	schema validate: data.
	"below the minimum is invalid"
	data := NeoJSONReader fromString: '0.6'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores non-numbers"
	data := NeoJSONReader fromString: '"x"'.
	schema validate: data