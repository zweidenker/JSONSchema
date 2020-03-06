as yet unclassified
read: string object: object
	| reader neededKeys |
	reader := (NeoJSONReader on: string readStream).
	neededKeys := required asOrderedCollection.
	reader parseMapKeysDo: [ :key | | schema value |
		schema :=	properties 
			at: key 
			ifAbsent: [
				self flag: #todo.
				"check for additionProperties"
				JSONInvalidPropertyError signal: 'no property ', key asString, ' defined']. 
		value := schema readUsing: reader.
		object 
			perform: key asSymbol asMutator 
			with: value.
		neededKeys remove: key ifAbsent: [] ].
	neededKeys ifNotEmpty: [ 
		JSONMissingRequiredProperty signal: 'missing properties ', ($, join: neededKeys) ].
	^ object