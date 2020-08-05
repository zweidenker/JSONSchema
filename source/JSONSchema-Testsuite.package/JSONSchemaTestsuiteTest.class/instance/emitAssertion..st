private
emitAssertion: aStream
	aStream
		nextPutAll:
			(valid
				ifTrue: [ 'self assertValid:' ]
				ifFalse: [ 'self assertInvalid:' ]);
		print: (NeoJSONWriter toString: data);
		nextPutAll: ' description: ';
		print: description;
		cr