as yet unclassified
testConstWith0DoesNotMatchOtherZeroLikeTypes
	"const with 0 does not match other zero-like types"

	| schema data |
	schema := JSONSchema fromString: '{"const":0}'.
	"false is invalid"
	data := NeoJSONReader fromString: 'false'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"integer zero is valid"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"float zero is valid"
	data := NeoJSONReader fromString: '0.0'.
	schema validate: data.
	"empty object is invalid"
	data := NeoJSONReader fromString: '{}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty array is invalid"
	data := NeoJSONReader fromString: '[]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty string is invalid"
	data := NeoJSONReader fromString: '""'.
	self should: [ schema validate: data ] raise: JSONSchemaError