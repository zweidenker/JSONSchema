tests
testECMA262HasNoSupportForZAnchorFromNET
	self
		assertInvalid: '"^\\S(|(.|\\n)*\\S)\\Z"'
		description: 'ECMA 262 has no support for \Z anchor from .NET'