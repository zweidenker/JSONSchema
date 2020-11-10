reading
read: string object: object
	| json |
	json := (NeoJSONReader on: string readStream) next .
	json isDictionary ifFalse: [ 
		JSONTypeError signal: 'json type is not object' ].
	json keysAndValuesDo: [ :key :value | 
		object 
			jsonSchemaAt: key asSymbol 
			put: value ].
	^ object