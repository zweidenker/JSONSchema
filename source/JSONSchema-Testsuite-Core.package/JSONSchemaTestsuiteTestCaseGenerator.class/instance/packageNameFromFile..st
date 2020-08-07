private
packageNameFromFile: aJSONSchemaTestsuiteFile
	| cleanedName |
	cleanedName := self
		identifierFromString: aJSONSchemaTestsuiteFile fileReference basenameWithoutExtension.
	^ self class testsPackageName , '-' , cleanedName