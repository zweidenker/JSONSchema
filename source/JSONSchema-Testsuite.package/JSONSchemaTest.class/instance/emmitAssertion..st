as yet unclassified
emmitAssertion: aStream
	aStream
		nextPutAll: 'data := NeoJSONReader fromString: ';
		print: (NeoJSONWriter toString: data);
		nextPut: $.;
		cr.
	valid
		ifTrue: [ aStream
				nextPutAll: 'schema validate: data.';
				cr ]
		ifFalse: [ aStream
				nextPutAll: 'self should: [ ';
				nextPutAll: 'schema validate: data.';
				nextPutAll: ' ] raise: JSONSchemaError.';
				cr ]