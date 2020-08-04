private
files
	^ files
		ifNil: [ files := (self archive / 'JSON-Schema-Test-Suite-master' / 'tests'
				/ version allChildrenMatching: '*.json')
				collect: [ :each | JSONSchemaTestsuiteFile fromFileReference: each ] ]