visiting
visitGroup: aJSONSchemaTestsuiteGroup
	^ aJSONSchemaTestsuiteGroup tests
		collect: [ :test | test acceptVisitor: self ]