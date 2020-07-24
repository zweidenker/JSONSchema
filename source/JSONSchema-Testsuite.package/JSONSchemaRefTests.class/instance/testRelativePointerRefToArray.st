as yet unclassified
testRelativePointerRefToArray
	"relative pointer ref to array"

	| schema data |
	schema := JSONSchema
		fromString: '{"items":[{"type":"integer"},{"$ref":"#/items/0"}]}'.
	"match array"
	data := NeoJSONReader fromString: '[1,2]'.
	schema validate: data.
	"mismatch array"
	data := NeoJSONReader fromString: '[1,"foo"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError