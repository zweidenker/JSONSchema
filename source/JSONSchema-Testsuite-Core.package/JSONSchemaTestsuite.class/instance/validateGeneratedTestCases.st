actions
validateGeneratedTestCases
	| classes selectors |
	classes := JSONSchemaTestsuiteTestCase allSubclasses.
	self assert: [ self allGroups size = classes size ].
	selectors := OrderedCollection
		streamContents:
			[ :stream | classes do: [ :class | stream nextPutAll: class testSelectors ] ].
	self assert: [ self allTests size = selectors size ]