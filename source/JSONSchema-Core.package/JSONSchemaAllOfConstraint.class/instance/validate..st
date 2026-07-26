validation
validate: anObject
	| visitor |
	visitor := JSONSchemaReferenceResolveVisitor new.
	allOf do: [ :definition | (visitor visitSchemaSpec: definition) validate: anObject ]