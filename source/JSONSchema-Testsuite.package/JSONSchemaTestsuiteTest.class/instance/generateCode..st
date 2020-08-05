code generation
generateCode: aClass
	| methodName methodContent |
	methodContent := String
		streamContents: [ :stream | 
			self
				emitMethodHeader: stream;
				emitTestComment: stream;
				emitAssertion: stream ].
	methodName := aClass compile: methodContent.
	(aClass >> methodName)
		reformat;
		protocol: 'tests'