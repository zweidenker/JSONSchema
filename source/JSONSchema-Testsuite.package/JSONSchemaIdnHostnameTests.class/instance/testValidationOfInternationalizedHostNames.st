as yet unclassified
testValidationOfInternationalizedHostNames
	"validation of internationalized host names"

	| schema data |
	schema := JSONSchema fromString: '{"format":"idn-hostname"}'.
	"a valid host name (example.test in Hangul)"
	data := NeoJSONReader fromString: '"실례.테스트"'.
	schema validate: data.
	"illegal first char U+302E Hangul single dot tone mark"
	data := NeoJSONReader fromString: '"〮실례.테스트"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"contains illegal char U+302E Hangul single dot tone mark"
	data := NeoJSONReader fromString: '"실〮례.테스트"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"a host name with a component too long"
	data := NeoJSONReader
		fromString:
			'"실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실례례테스트례례례례례례례례례례례례례례례례례테스트례례례례례례례례례례례례례례례례례례례테스트례례례례례례례례례례례례테스트례례실례.테스트"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"invalid label, correct Punycode"
	"https://tools.ietf.org/html/rfc5890#section-2.3.2.1 https://tools.ietf.org/html/rfc5891#section-4.4 https://tools.ietf.org/html/rfc3492#section-7.1"
	data := NeoJSONReader fromString: '"-> $1.00 <--"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"valid Chinese Punycode"
	"https://tools.ietf.org/html/rfc5890#section-2.3.2.1 https://tools.ietf.org/html/rfc5891#section-4.4"
	data := NeoJSONReader fromString: '"xn--ihqwcrb4cv8a8dqg056pqjye"'.
	schema validate: data.
	"invalid Punycode"
	"https://tools.ietf.org/html/rfc5891#section-4.4 https://tools.ietf.org/html/rfc5890#section-2.3.2.1"
	data := NeoJSONReader fromString: '"xn--X"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"U-label contains '--' in the 3rd and 4th position"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1 https://tools.ietf.org/html/rfc5890#section-2.3.2.1"
	data := NeoJSONReader fromString: '"XN--aa---o47jg78q"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"U-label starts with a dash"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"
	data := NeoJSONReader fromString: '"-hello"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"U-label ends with a dash"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"
	data := NeoJSONReader fromString: '"hello-"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"U-label starts and ends with a dash"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"
	data := NeoJSONReader fromString: '"-hello-"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Begins with a Spacing Combining Mark"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"
	data := NeoJSONReader fromString: '"ःhello"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Begins with a Nonspacing Mark"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"
	data := NeoJSONReader fromString: '"̀hello"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Begins with an Enclosing Mark"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"
	data := NeoJSONReader fromString: '"҈hello"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Exceptions that are PVALID, left-to-right chars"
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"
	data := NeoJSONReader fromString: '"ßς་〇"'.
	schema validate: data.
	"Exceptions that are PVALID, right-to-left chars"
	"https://tools.ietf.org/html/rfc/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"
	data := NeoJSONReader fromString: '"۽۾"'.
	schema validate: data.
	"Exceptions that are DISALLOWED, right-to-left chars"
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"
	data := NeoJSONReader fromString: '"ـߺ"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Exceptions that are DISALLOWED, left-to-right chars"
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6 Note: The two combining marks (U+302E and U+302F) are in the middle and not at the start"
	data := NeoJSONReader fromString: '"〱〲〳〴〵〮〯〻"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"MIDDLE DOT with no preceding 'l'"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"
	data := NeoJSONReader fromString: '"a·l"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"MIDDLE DOT with nothing preceding"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"
	data := NeoJSONReader fromString: '"·l"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"MIDDLE DOT with no following 'l'"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"
	data := NeoJSONReader fromString: '"l·a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"MIDDLE DOT with nothing following"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"
	data := NeoJSONReader fromString: '"l·"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"MIDDLE DOT with surrounding 'l's"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"
	data := NeoJSONReader fromString: '"l·l"'.
	schema validate: data.
	"Greek KERAIA not followed by Greek"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"
	data := NeoJSONReader fromString: '"α͵S"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Greek KERAIA not followed by anything"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"
	data := NeoJSONReader fromString: '"α͵"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Greek KERAIA followed by Greek"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"
	data := NeoJSONReader fromString: '"α͵β"'.
	schema validate: data.
	"Hebrew GERESH not preceded by Hebrew"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"
	data := NeoJSONReader fromString: '"A׳ב"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Hebrew GERESH not preceded by anything"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"
	data := NeoJSONReader fromString: '"׳ב"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Hebrew GERESH preceded by Hebrew"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"
	data := NeoJSONReader fromString: '"א׳ב"'.
	schema validate: data.
	"Hebrew GERSHAYIM not preceded by Hebrew"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"
	data := NeoJSONReader fromString: '"A״ב"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Hebrew GERSHAYIM not preceded by anything"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"
	data := NeoJSONReader fromString: '"״ב"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Hebrew GERSHAYIM preceded by Hebrew"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"
	data := NeoJSONReader fromString: '"א״ב"'.
	schema validate: data.
	"KATAKANA MIDDLE DOT with no Hiragana, Katakana, or Han"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"
	data := NeoJSONReader fromString: '"def・abc"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"KATAKANA MIDDLE DOT with no other characters"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"
	data := NeoJSONReader fromString: '"・"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"KATAKANA MIDDLE DOT with Hiragana"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"
	data := NeoJSONReader fromString: '"・ぁ"'.
	schema validate: data.
	"KATAKANA MIDDLE DOT with Katakana"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"
	data := NeoJSONReader fromString: '"・ァ"'.
	schema validate: data.
	"KATAKANA MIDDLE DOT with Han"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"
	data := NeoJSONReader fromString: '"・丈"'.
	schema validate: data.
	"Arabic-Indic digits mixed with Extended Arabic-Indic digits"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.8"
	data := NeoJSONReader fromString: '"٠۰"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"Arabic-Indic digits not mixed with Extended Arabic-Indic digits"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.8"
	data := NeoJSONReader fromString: '"ب٠ب"'.
	schema validate: data.
	"Extended Arabic-Indic digits not mixed with Arabic-Indic digits"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.9"
	data := NeoJSONReader fromString: '"۰0"'.
	schema validate: data.
	"ZERO WIDTH JOINER not preceded by Virama"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"
	data := NeoJSONReader fromString: '"क‍ष"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ZERO WIDTH JOINER not preceded by anything"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"
	data := NeoJSONReader fromString: '"‍ष"'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ZERO WIDTH JOINER preceded by Virama"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"
	data := NeoJSONReader fromString: '"क्‍ष"'.
	schema validate: data.
	"ZERO WIDTH NON-JOINER preceded by Virama"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.1"
	data := NeoJSONReader fromString: '"क्‌ष"'.
	schema validate: data.
	"ZERO WIDTH NON-JOINER not preceded by Virama but matches regexp"
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.1 https://www.w3.org/TR/alreq/#h_disjoining_enforcement"
	data := NeoJSONReader fromString: '"بي‌بي"'.
	schema validate: data