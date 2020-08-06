code generation
createClassForGroup: aJSONSchemaTestsuiteGroup
	^ JSONSchemaTestsuiteTestCase
		subclass: (groupClassMapping at: aJSONSchemaTestsuiteGroup)
		instanceVariableNames: ''
		classVariableNames: ''
		package: taggedPackageName