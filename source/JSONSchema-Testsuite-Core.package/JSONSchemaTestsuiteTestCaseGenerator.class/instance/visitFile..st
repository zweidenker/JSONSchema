visiting
visitFile: aJSONSchemaTestsuiteFile
	| groups |
	groups := aJSONSchemaTestsuiteFile groups.
	taggedPackageName := self
		packageNameFromFile: aJSONSchemaTestsuiteFile.
	groups do: [ :group | group acceptVisitor: self ].
	taggedPackageName := nil