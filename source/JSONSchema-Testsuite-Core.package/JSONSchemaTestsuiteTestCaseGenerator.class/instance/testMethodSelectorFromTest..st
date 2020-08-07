private
testMethodSelectorFromTest: aJSONSchemaTestsuiteTest
	| cleanedName |
	cleanedName := self
		identifierFromString: aJSONSchemaTestsuiteTest description.
	^ 'test' , cleanedName