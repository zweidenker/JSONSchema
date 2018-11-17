decoration
resolve
	^ JSONSchemaReferenceResolveVisitor new
		schemaRepository: self;
		read: (self as: JSONSchemaDefinition)