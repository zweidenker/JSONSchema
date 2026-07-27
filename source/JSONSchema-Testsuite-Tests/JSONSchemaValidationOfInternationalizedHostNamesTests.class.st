Class {
	#name : 'JSONSchemaValidationOfInternationalizedHostNamesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IdnHostname',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IdnHostname'
}

{ #category : 'testing' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> expectedFailures [
	^ #(#testAHostNameWithAComponentTooLong #testArabicIndicDigitsMixedWithExtendedArabicIndicDigits #testBeginsWithANonspacingMark #testBeginsWithASpacingCombiningMark #testBeginsWithAnEnclosingMark #testContainsIllegalCharU302EHangulSingleDotToneMark #testExceptionsThatAreDISALLOWEDLeftToRightChars #testExceptionsThatAreDISALLOWEDRightToLeftChars #testGreekKERAIANotFollowedByAnything #testGreekKERAIANotFollowedByGreek #testHebrewGERESHNotPrecededByAnything #testHebrewGERESHNotPrecededByHebrew #testHebrewGERSHAYIMNotPrecededByAnything #testHebrewGERSHAYIMNotPrecededByHebrew #testIllegalFirstCharU302EHangulSingleDotToneMark #testInvalidLabelCorrectPunycode #testInvalidPunycode #testKATAKANAMIDDLEDOTWithNoHiraganaKatakanaOrHan #testKATAKANAMIDDLEDOTWithNoOtherCharacters #testMIDDLEDOTWithNoFollowingL #testMIDDLEDOTWithNoPrecedingL #testMIDDLEDOTWithNothingFollowing #testMIDDLEDOTWithNothingPreceding #testULabelContainsInThe3rdAnd4thPosition #testULabelEndsWithADash #testULabelStartsAndEndsWithADash #testULabelStartsWithADash #testZEROWIDTHJOINERNotPrecededByAnything #testZEROWIDTHJOINERNotPrecededByVirama)
]

{ #category : 'accessing' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> schemaString [
	^ '{"format":"idn-hostname"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testAHostNameWithAComponentTooLong [
	self
		assertInvalid:
			'"실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실례례테스트례례례례례례례례례례례례례례례례례테스트례례례례례례례례례례례례례례례례례례례테스트례례례례례례례례례례례례테스트례례실례.테스트"'
		description: 'a host name with a component too long'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testAValidHostNameExampleTestInHangul [
	self
		assertValid: '"실례.테스트"'
		description: 'a valid host name (example.test in Hangul)'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testArabicIndicDigitsMixedWithExtendedArabicIndicDigits [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.8"

	self
		assertInvalid: '"٠۰"'
		description: 'Arabic-Indic digits mixed with Extended Arabic-Indic digits'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testArabicIndicDigitsNotMixedWithExtendedArabicIndicDigits [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.8"

	self
		assertValid: '"ب٠ب"'
		description: 'Arabic-Indic digits not mixed with Extended Arabic-Indic digits'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testBeginsWithANonspacingMark [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"

	self
		assertInvalid: '"̀hello"'
		description: 'Begins with a Nonspacing Mark'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testBeginsWithASpacingCombiningMark [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"

	self
		assertInvalid: '"ःhello"'
		description: 'Begins with a Spacing Combining Mark'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testBeginsWithAnEnclosingMark [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.2"

	self
		assertInvalid: '"҈hello"'
		description: 'Begins with an Enclosing Mark'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testContainsIllegalCharU302EHangulSingleDotToneMark [
	self
		assertInvalid: '"실〮례.테스트"'
		description: 'contains illegal char U+302E Hangul single dot tone mark'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testExceptionsThatAreDISALLOWEDLeftToRightChars [
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6 Note: The two combining marks (U+302E and U+302F) are in the middle and not at the start"

	self
		assertInvalid: '"〱〲〳〴〵〮〯〻"'
		description: 'Exceptions that are DISALLOWED, left-to-right chars'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testExceptionsThatAreDISALLOWEDRightToLeftChars [
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"

	self
		assertInvalid: '"ـߺ"'
		description: 'Exceptions that are DISALLOWED, right-to-left chars'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testExceptionsThatArePVALIDLeftToRightChars [
	"https://tools.ietf.org/html/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"

	self
		assertValid: '"ßς་〇"'
		description: 'Exceptions that are PVALID, left-to-right chars'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testExceptionsThatArePVALIDRightToLeftChars [
	"https://tools.ietf.org/html/rfc/rfc5891#section-4.2.2 https://tools.ietf.org/html/rfc5892#section-2.6"

	self
		assertValid: '"۽۾"'
		description: 'Exceptions that are PVALID, right-to-left chars'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testExtendedArabicIndicDigitsNotMixedWithArabicIndicDigits [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.9"

	self
		assertValid: '"۰0"'
		description: 'Extended Arabic-Indic digits not mixed with Arabic-Indic digits'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testGreekKERAIAFollowedByGreek [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"

	self
		assertValid: '"α͵β"'
		description: 'Greek KERAIA followed by Greek'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testGreekKERAIANotFollowedByAnything [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"

	self
		assertInvalid: '"α͵"'
		description: 'Greek KERAIA not followed by anything'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testGreekKERAIANotFollowedByGreek [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.4"

	self
		assertInvalid: '"α͵S"'
		description: 'Greek KERAIA not followed by Greek'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testHebrewGERESHNotPrecededByAnything [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"

	self
		assertInvalid: '"׳ב"'
		description: 'Hebrew GERESH not preceded by anything'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testHebrewGERESHNotPrecededByHebrew [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"

	self
		assertInvalid: '"A׳ב"'
		description: 'Hebrew GERESH not preceded by Hebrew'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testHebrewGERESHPrecededByHebrew [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.5"

	self
		assertValid: '"א׳ב"'
		description: 'Hebrew GERESH preceded by Hebrew'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testHebrewGERSHAYIMNotPrecededByAnything [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"

	self
		assertInvalid: '"״ב"'
		description: 'Hebrew GERSHAYIM not preceded by anything'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testHebrewGERSHAYIMNotPrecededByHebrew [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"

	self
		assertInvalid: '"A״ב"'
		description: 'Hebrew GERSHAYIM not preceded by Hebrew'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testHebrewGERSHAYIMPrecededByHebrew [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.6"

	self
		assertValid: '"א״ב"'
		description: 'Hebrew GERSHAYIM preceded by Hebrew'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testIllegalFirstCharU302EHangulSingleDotToneMark [
	self
		assertInvalid: '"〮실례.테스트"'
		description: 'illegal first char U+302E Hangul single dot tone mark'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testInvalidLabelCorrectPunycode [
	"https://tools.ietf.org/html/rfc5890#section-2.3.2.1 https://tools.ietf.org/html/rfc5891#section-4.4 https://tools.ietf.org/html/rfc3492#section-7.1"

	self
		assertInvalid: '"-> $1.00 <--"'
		description: 'invalid label, correct Punycode'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testInvalidPunycode [
	"https://tools.ietf.org/html/rfc5891#section-4.4 https://tools.ietf.org/html/rfc5890#section-2.3.2.1"

	self assertInvalid: '"xn--X"' description: 'invalid Punycode'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testKATAKANAMIDDLEDOTWithHan [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"

	self assertValid: '"・丈"' description: 'KATAKANA MIDDLE DOT with Han'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testKATAKANAMIDDLEDOTWithHiragana [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"

	self
		assertValid: '"・ぁ"'
		description: 'KATAKANA MIDDLE DOT with Hiragana'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testKATAKANAMIDDLEDOTWithKatakana [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"

	self
		assertValid: '"・ァ"'
		description: 'KATAKANA MIDDLE DOT with Katakana'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testKATAKANAMIDDLEDOTWithNoHiraganaKatakanaOrHan [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"

	self
		assertInvalid: '"def・abc"'
		description: 'KATAKANA MIDDLE DOT with no Hiragana, Katakana, or Han'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testKATAKANAMIDDLEDOTWithNoOtherCharacters [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.7"

	self
		assertInvalid: '"・"'
		description: 'KATAKANA MIDDLE DOT with no other characters'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testMIDDLEDOTWithNoFollowingL [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"

	self
		assertInvalid: '"l·a"'
		description: 'MIDDLE DOT with no following ''l'''
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testMIDDLEDOTWithNoPrecedingL [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"

	self
		assertInvalid: '"a·l"'
		description: 'MIDDLE DOT with no preceding ''l'''
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testMIDDLEDOTWithNothingFollowing [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"

	self
		assertInvalid: '"l·"'
		description: 'MIDDLE DOT with nothing following'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testMIDDLEDOTWithNothingPreceding [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"

	self
		assertInvalid: '"·l"'
		description: 'MIDDLE DOT with nothing preceding'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testMIDDLEDOTWithSurroundingLS [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.3"

	self
		assertValid: '"l·l"'
		description: 'MIDDLE DOT with surrounding ''l''s'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testULabelContainsInThe3rdAnd4thPosition [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1 https://tools.ietf.org/html/rfc5890#section-2.3.2.1"

	self
		assertInvalid: '"XN--aa---o47jg78q"'
		description: 'U-label contains "--" in the 3rd and 4th position'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testULabelEndsWithADash [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"

	self
		assertInvalid: '"hello-"'
		description: 'U-label ends with a dash'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testULabelStartsAndEndsWithADash [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"

	self
		assertInvalid: '"-hello-"'
		description: 'U-label starts and ends with a dash'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testULabelStartsWithADash [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.1"

	self
		assertInvalid: '"-hello"'
		description: 'U-label starts with a dash'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testValidChinesePunycode [
	"https://tools.ietf.org/html/rfc5890#section-2.3.2.1 https://tools.ietf.org/html/rfc5891#section-4.4"

	self
		assertValid: '"xn--ihqwcrb4cv8a8dqg056pqjye"'
		description: 'valid Chinese Punycode'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testZEROWIDTHJOINERNotPrecededByAnything [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"

	self
		assertInvalid: '"‍ष"'
		description: 'ZERO WIDTH JOINER not preceded by anything'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testZEROWIDTHJOINERNotPrecededByVirama [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"

	self
		assertInvalid: '"क‍ष"'
		description: 'ZERO WIDTH JOINER not preceded by Virama'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testZEROWIDTHJOINERPrecededByVirama [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.2 https://www.unicode.org/review/pr-37.pdf"

	self
		assertValid: '"क्‍ष"'
		description: 'ZERO WIDTH JOINER preceded by Virama'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testZEROWIDTHNONJOINERNotPrecededByViramaButMatchesRegexp [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.1 https://www.w3.org/TR/alreq/#h_disjoining_enforcement"

	self
		assertValid: '"بي‌بي"'
		description: 'ZERO WIDTH NON-JOINER not preceded by Virama but matches regexp'
]

{ #category : 'tests' }
JSONSchemaValidationOfInternationalizedHostNamesTests >> testZEROWIDTHNONJOINERPrecededByVirama [
	"https://tools.ietf.org/html/rfc5891#section-4.2.3.3 https://tools.ietf.org/html/rfc5892#appendix-A.1"

	self
		assertValid: '"क्‌ष"'
		description: 'ZERO WIDTH NON-JOINER preceded by Virama'
]
