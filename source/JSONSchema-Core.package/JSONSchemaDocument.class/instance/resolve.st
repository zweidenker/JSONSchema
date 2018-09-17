decoration
resolve
	^ JSONSchemaReferenceResolveVisitor new
		resolver: self;
		read: (self as: JSONSchemaSpec)