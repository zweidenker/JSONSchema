as yet unclassified
read: string object: object
	| json |
	json := (NeoJSONReader on: string readStream) next .
	json keysAndValuesDo: [ :key :value | 
		object 
			perform: key asSymbol asMutator 
			with: value ].
	^ object