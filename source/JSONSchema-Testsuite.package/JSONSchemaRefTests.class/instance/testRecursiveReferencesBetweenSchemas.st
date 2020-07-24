as yet unclassified
testRecursiveReferencesBetweenSchemas
	"Recursive references between schemas"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"description":"tree of nodes","required":["meta","nodes"],"definitions":{"node":{"description":"node","required":["value"],"$id":"http://localhost:1234/node","type":"object","properties":{"value":{"type":"number"},"subtree":{"$ref":"tree"}}}},"$id":"http://localhost:1234/tree","type":"object","properties":{"nodes":{"items":{"$ref":"node"},"type":"array"},"meta":{"type":"string"}}}'.
	"valid tree"
	data := NeoJSONReader
		fromString:
			'{"nodes":[{"value":1,"subtree":{"nodes":[{"value":1.1},{"value":1.2}],"meta":"child"}},{"value":2,"subtree":{"nodes":[{"value":2.1},{"value":2.2}],"meta":"child"}}],"meta":"root"}'.
	schema validate: data.
	"invalid tree"
	data := NeoJSONReader
		fromString:
			'{"nodes":[{"value":1,"subtree":{"nodes":[{"value":"string is invalid"},{"value":1.2}],"meta":"child"}},{"value":2,"subtree":{"nodes":[{"value":2.1},{"value":2.2}],"meta":"child"}}],"meta":"root"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError