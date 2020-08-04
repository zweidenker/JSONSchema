asserting
assertInvalid: json description: description
	| object |
	object := NeoJSONReader fromString: json.
	self
		should: [ schema validate: object ]
		raise: JSONSchemaError
		description: description