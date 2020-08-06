private
createFiles
	^ (self archive / 'JSON-Schema-Test-Suite-master' / 'tests'
		/ self version allChildrenMatching: '*.json')
		collect: [ :each | JSONSchemaTestsuiteFile fromFileReference: each ]