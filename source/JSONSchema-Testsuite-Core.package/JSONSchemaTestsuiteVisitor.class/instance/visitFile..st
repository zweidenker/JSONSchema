visiting
visitFile: aJSONSchemaTestsuiteFile
	^ aJSONSchemaTestsuiteFile groups
		collect: [ :group | group acceptVisitor: self ]