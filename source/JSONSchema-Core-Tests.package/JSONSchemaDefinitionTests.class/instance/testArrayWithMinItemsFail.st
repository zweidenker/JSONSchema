tests
testArrayWithMinItemsFail
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "minItems": 2
}'.
	self 
		should: [ value := schema validate: { 'foo' } ]
		raise: Error.
		
