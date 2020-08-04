tests
testArrayWithMinItems
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "minItems": 1
}'.
	self 
		shouldnt: [ value := schema validate: { 'bar' } ]
		raise: Error.
		
