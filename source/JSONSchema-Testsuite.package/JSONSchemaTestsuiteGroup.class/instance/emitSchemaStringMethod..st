private
emitSchemaStringMethod: aStream
	aStream
		nextPutAll: 'schemaString';
		cr;
		nextPutAll: '^ ';
		print: (NeoJSONWriter toString: schema);
		nextPut: $.;
		cr