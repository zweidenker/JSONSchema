as yet unclassified
testFloatAndIntegersAreEqualUpTo64BitRepresentationLimits
	"float and integers are equal up to 64-bit representation limits"

	| schema data |
	schema := JSONSchema fromString: '{"const":9007199254740992}'.
	"integer is valid"
	data := NeoJSONReader fromString: '9007199254740992'.
	schema validate: data.
	"integer minus one is invalid"
	data := NeoJSONReader fromString: '9007199254740991'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"float is valid"
	data := NeoJSONReader fromString: '9.007199254740992e15'.
	schema validate: data.
	"float minus one is invalid"
	data := NeoJSONReader fromString: '9.007199254740991e15'.
	self should: [ schema validate: data ] raise: JSONSchemaError