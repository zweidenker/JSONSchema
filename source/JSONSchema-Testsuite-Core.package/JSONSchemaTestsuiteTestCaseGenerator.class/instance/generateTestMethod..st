code generation
generateTestMethod: aJSONSchemaTestsuiteTest
	| methodSource methodName |
	methodSource := String
		streamContents: [ :stream | 
			stream
				nextPutAll: (testSelectorMapping at: aJSONSchemaTestsuiteTest);
				cr.
			aJSONSchemaTestsuiteTest comment isNil
				ifFalse: [ stream nextPutAll: aJSONSchemaTestsuiteTest comment asComment ].
			stream
				nextPutAll:
					(aJSONSchemaTestsuiteTest valid
						ifTrue: [ 'self assertValid:' ]
						ifFalse: [ 'self assertInvalid:' ]);
				print: (NeoJSONWriter toString: aJSONSchemaTestsuiteTest data);
				nextPutAll: ' description: ';
				print: aJSONSchemaTestsuiteTest description;
				cr ].
	methodName := testCaseClass compile: methodSource.
	(testCaseClass >> methodName)
		protocol: 'tests';
		reformat