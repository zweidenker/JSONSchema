initialization
initializeFromDefinition: aSchemaDefinition 
	self definitionProperties do: [ :each|
		(aSchemaDefinition perform: each asSymbol) ifNotNil: [ :value |
			self perform: each asSymbol asMutator with: value ] ]