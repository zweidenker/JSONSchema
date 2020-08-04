tests
testArrayWithMaxItemsFail
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "maxItems": 2
}'.
	self 
		should: [ value := schema validate: { 'bar'. 'foo' . 'baz' } ]
		raise: Error.
		
