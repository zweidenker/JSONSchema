as yet unclassified
testValidateAgainstCorrectBranchThenVsElse
	"validate against correct branch, then vs else"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"else":{"multipleOf":2},"then":{"minimum":-10},"if":{"exclusiveMaximum":0}}'.
	"valid through then"
	data := NeoJSONReader fromString: '-1'.
	schema validate: data.
	"invalid through then"
	data := NeoJSONReader fromString: '-100'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"valid through else"
	data := NeoJSONReader fromString: '4'.
	schema validate: data.
	"invalid through else"
	data := NeoJSONReader fromString: '3'.
	self should: [ schema validate: data ] raise: JSONSchemaError