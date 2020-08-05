private
files
	^ files
		ifNil: [ files := (self archive / 'JSON-Schema-Test-Suite-master' / 'tests'
				/ 'draft7' allChildrenMatching: '*.json')
				collect: [ :each | JSONSchemaTestsuiteFile fromFileReference: each ] ]