as yet unclassified
read: string object: object
	| reader |
	reader := (NeoJSONReader on: string readStream).
	reader parseMapKeysDo: [ :key | | schema value |
		schema :=	properties 
			at: key 
			ifAbsent: [Error signal: 'no property ', key asString, ' defined']. 
		value := schema readUsing: reader.
		object 
			perform: key asSymbol asMutator 
			with: value ].
	^ object