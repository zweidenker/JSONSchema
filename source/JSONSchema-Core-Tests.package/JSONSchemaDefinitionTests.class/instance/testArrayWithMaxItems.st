tests
testArrayWithMaxItems
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "maxItems": 2
}'.
	self 
		shouldnt: [ value := schema validate: { 'bar' } ]
		raise: Error.
		
