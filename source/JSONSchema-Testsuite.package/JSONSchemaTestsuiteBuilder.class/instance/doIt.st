menu commands
doIt
	| repositoryUrl zipRef zipContent fs testCaseRefs testCases |
	repositoryUrl := 'https://github.com/json-schema-org/JSON-Schema-Test-Suite/archive/master.zip'.
	zipRef := FileLocator temp
		/ ('JSON-Schema-Test-Suite-' , UUIDGenerator next asString) , 'zip'.
	zipContent := (ZnEasy get: repositoryUrl) contents.
	zipRef
		binaryWriteStreamDo: [ :stream | stream nextPutAll: zipContent ].
	fs := (FileSystem zip: zipRef) open workingDirectory.
	testCaseRefs := fs / 'JSON-Schema-Test-Suite-master' / 'tests'
		/ 'draft7' allChildrenMatching: '*.json'.
	testCases := testCaseRefs
		collect: [ :each | JSONSchemaTestCase fromFileReference: each ].
	testCases do: [ :each | each generateCode ].
	^ testCases