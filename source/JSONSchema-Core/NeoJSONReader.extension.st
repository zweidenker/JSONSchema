Extension { #name : 'NeoJSONReader' }

{ #category : '*jsonschema-core' }
NeoJSONReader >> peekFirstKey [
	| stream |
	stream := readStream clone.
	stream upTo: $".
	^ (stream upTo: $")
]
