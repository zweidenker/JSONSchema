visiting
visitGroup: aJSONSchemaTestsuiteGroup
	| tests |
	tests := aJSONSchemaTestsuiteGroup tests.
	testCaseClass := self createClassForGroup: aJSONSchemaTestsuiteGroup.
	self createTestSelectorMapping: aJSONSchemaTestsuiteGroup.
	self generateSchemaMethod: aJSONSchemaTestsuiteGroup.
	tests do: [ :test | test acceptVisitor: self ].
	testCaseClass := nil