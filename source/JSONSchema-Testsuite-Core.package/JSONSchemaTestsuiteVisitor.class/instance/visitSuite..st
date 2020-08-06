visiting
visitSuite: aJSONSchemaTestsuite
	^ aJSONSchemaTestsuite files
		collect: [ :file | file acceptVisitor: self ]