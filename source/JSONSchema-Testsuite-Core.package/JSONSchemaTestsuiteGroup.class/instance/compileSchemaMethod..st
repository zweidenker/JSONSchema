private
compileSchemaMethod: class
	| methodName methodContent |
	methodContent := String
		streamContents: [ :stream | self emitSchemaStringMethod: stream ].
	methodName := class compile: methodContent.
	(class >> methodName)
		reformat;
		protocol: 'accessing'