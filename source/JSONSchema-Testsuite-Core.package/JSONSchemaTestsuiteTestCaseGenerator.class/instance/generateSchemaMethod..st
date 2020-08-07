code generation
generateSchemaMethod: aJSONSchemaTestsuiteGroup
	| methodSource methodName |
	methodSource := 'schemaString
	^ <1p>'
		expandMacrosWith: (NeoJSONWriter toString: aJSONSchemaTestsuiteGroup schema).
	methodName := testCaseClass compile: methodSource.
	(testCaseClass >> methodName)
		protocol: 'accessing';
		reformat