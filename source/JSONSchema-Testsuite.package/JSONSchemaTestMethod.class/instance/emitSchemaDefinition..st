as yet unclassified
emitSchemaDefinition: aStream
	aStream
		nextPutAll: 'schema := JSONSchema fromString: ';
		print: (NeoJSONWriter toString: schema);
		nextPut: $.;
		cr