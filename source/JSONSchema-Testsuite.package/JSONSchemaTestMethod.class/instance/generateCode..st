as yet unclassified
generateCode: aClass
	| methodContent methodName |
	methodContent := String
		streamContents: [ :stream | 
			self
				emitMethodName: stream;
				emitMethodComment: stream;
				emitTemps: #('schema' 'data') to: stream;
				emitSchemaDefinition: stream.
			tests do: [ :test | test generateCode: stream ] ].
	methodName := aClass compile: methodContent.
	(aClass >> methodName) reformat