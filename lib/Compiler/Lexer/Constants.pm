use strict;
use warnings;

package Compiler::Lexer::TokenType;
use constant {
    T_Return => 0,
    T_Add => 1,
    T_Sub => 2,
    T_Mul => 3,
    T_Div => 4,
    T_Mod => 5,
    T_ThreeTermOperator => 6,
    T_Greater => 7,
    T_Less => 8,
    T_StringAdd => 9,
    T_Ref => 10,
    T_Glob => 11,
    T_BitNot => 12,
    T_BitOr => 13,
    T_AlphabetOr => 14,
    T_BitAnd => 15,
    T_AlphabetAnd => 16,
    T_BitXOr => 17,
    T_AlphabetXOr => 18,
    T_StringMul => 19,
    T_AddEqual => 20,
    T_SubEqual => 21,
    T_MulEqual => 22,
    T_DivEqual => 23,
    T_ModEqual => 24,
    T_StringAddEqual => 25,
    T_LeftShiftEqual => 26,
    T_RightShiftEqual => 27,
    T_StringMulEqual => 28,
    T_GreaterEqual => 29,
    T_LessEqual => 30,
    T_EqualEqual => 31,
    T_Diamond => 32,
    T_Compare => 33,
    T_PolymorphicCompare => 34,
    T_RegOK => 35,
    T_RegNot => 36,
    T_NotEqual => 37,
    T_StringLess => 38,
    T_StringLessEqual => 39,
    T_StringGreater => 40,
    T_StringGreaterEqual => 41,
    T_StringEqual => 42,
    T_StringNotEqual => 43,
    T_StringCompare => 44,
    T_Inc => 45,
    T_Dec => 46,
    T_Exp => 47,
    T_PowerEqual => 48,
    T_DefaultEqual => 49,
    T_LeftShift => 50,
    T_RightShift => 51,
    T_And => 52,
    T_Or => 53,
    T_AndBitEqual => 54,
    T_OrBitEqual => 55,
    T_NotBitEqual => 56,
    T_OrEqual => 57,
    T_AndEqual => 58,
    T_Slice => 59,
    T_DefaultOperator => 60,
    T_ToDo => 61,
    T_VarDecl => 62,
    T_FunctionDecl => 63,
    T_Method => 64,
    T_Assign => 65,
    T_ArraySize => 66,
    T_Is => 67,
    T_Not => 68,
    T_AlphabetNot => 69,
    T_BuiltinFunc => 70,
    T_RequireDecl => 71,
    T_Import => 72,
    T_SpecificKeyword => 73,
    T_DataWord => 74,
    T_ModWord => 75,
    T_AUTOLOAD => 76,
    T_CORE => 77,
    T_DESTROY => 78,
    T_STDIN => 79,
    T_STDOUT => 80,
    T_STDERR => 81,
    T_Redo => 82,
    T_Next => 83,
    T_Last => 84,
    T_Goto => 85,
    T_Continue => 86,
    T_Do => 87,
    T_Break => 88,
    T_Handle => 89,
    T_LocalDecl => 90,
    T_OurDecl => 91,
    T_StateDecl => 92,
    T_UseDecl => 93,
    T_UsedName => 94,
    T_RequiredName => 95,
    T_IfStmt => 96,
    T_ElseStmt => 97,
    T_ElsifStmt => 98,
    T_UnlessStmt => 99,
    T_UntilStmt => 100,
    T_WhenStmt => 101,
    T_GivenStmt => 102,
    T_DefaultStmt => 103,
    T_Comma => 104,
    T_Colon => 105,
    T_SemiColon => 106,
    T_LeftParenthesis => 107,
    T_RightParenthesis => 108,
    T_LeftBrace => 109,
    T_RightBrace => 110,
    T_LeftBracket => 111,
    T_RightBracket => 112,
    T_ArrayDereference => 113,
    T_HashDereference => 114,
    T_ScalarDereference => 115,
    T_CodeDereference => 116,
    T_ShortScalarDereference => 117,
    T_ShortArrayDereference => 118,
    T_ShortHashDereference => 119,
    T_ShortCodeDereference => 120,
    T_ArraySizeDereference => 121,
    T_Key => 122,
    T_BareWord => 123,
    T_Arrow => 124,
    T_Pointer => 125,
    T_NamespaceResolver => 126,
    T_Namespace => 127,
    T_Package => 128,
    T_Class => 129,
    T_CallDecl => 130,
    T_CodeRef => 131,
    T_WhileStmt => 132,
    T_ForStmt => 133,
    T_ForeachStmt => 134,
    T_Annotation => 135,
    T_ArgumentArray => 136,
    T_SpecificValue => 137,
    T_ConstValue => 138,
    T_ProgramArgument => 139,
    T_LibraryDirectories => 140,
    T_Environment => 141,
    T_Include => 142,
    T_Signal => 143,
    T_RegOpt => 144,
    T_RegQuote => 145,
    T_RegDoubleQuote => 146,
    T_RegList => 147,
    T_RegExec => 148,
    T_RegDecl => 149,
    T_RegMatch => 150,
    T_RegDelim => 151,
    T_HandleDelim => 152,
    T_RegMiddleDelim => 153,
    T_RegAllReplace => 154,
    T_RegReplace => 155,
    T_RegReplaceFrom => 156,
    T_RegReplaceTo => 157,
    T_FieldDecl => 158,
    T_TypeRef => 159,
    T_LabelRef => 160,
    T_LocalVarDecl => 161,
    T_GlobalVarDecl => 162,
    T_MultiLocalVarDecl => 163,
    T_MultiGlobalVarDecl => 164,
    T_Prototype => 165,
    T_Var => 166,
    T_CodeVar => 167,
    T_ArrayVar => 168,
    T_HashVar => 169,
    T_Int => 170,
    T_Double => 171,
    T_String => 172,
    T_RawString => 173,
    T_ExecString => 174,
    T_VersionString => 175,
    T_HereDocumentTag => 176,
    T_HereDocumentRawTag => 177,
    T_HereDocumentExecTag => 178,
    T_HereDocumentBareTag => 179,
    T_RawHereDocument => 180,
    T_HereDocument => 181,
    T_HereDocumentEnd => 182,
    T_FormatDecl => 183,
    T_Format => 184,
    T_FormatEnd => 185,
    T_Object => 186,
    T_RegExp => 187,
    T_Array => 188,
    T_Hash => 189,
    T_Operator => 190,
    T_LocalVar => 191,
    T_LocalArrayVar => 192,
    T_LocalHashVar => 193,
    T_GlobalVar => 194,
    T_GlobalArrayVar => 195,
    T_GlobalHashVar => 196,
    T_ArrayRef => 197,
    T_HashRef => 198,
    T_ArrayAt => 199,
    T_HashAt => 200,
    T_ArraySet => 201,
    T_HashSet => 202,
    T_Function => 203,
    T_Call => 204,
    T_Argument => 205,
    T_List => 206,
    T_Default => 207,
    T_Pod => 208,
    T_Comment => 209,
    T_WhiteSpace => 210,
    T_Undefined => 211
};

package Compiler::Lexer::SyntaxType;
use constant {
    T_Value => 0,
    T_Term => 1,
    T_Expr => 2,
    T_Stmt => 3,
    T_BlockStmt => 4
};

package Compiler::Lexer::Kind;
use constant {
    T_Return => 0,
    T_Operator => 1,
    T_Assign => 2,
    T_Decl => 3,
    T_Function => 4,
    T_SingleTerm => 5,
    T_Import => 6,
    T_SpecificKeyword => 7,
    T_DataWord => 8,
    T_ModWord => 9,
    T_AUTOLOAD => 10,
    T_CORE => 11,
    T_DESTROY => 12,
    T_Handle => 13,
    T_Control => 14,
    T_Do => 15,
    T_Module => 16,
    T_Stmt => 17,
    T_DefaultStmt => 18,
    T_Comma => 19,
    T_Colon => 20,
    T_StmtEnd => 21,
    T_Symbol => 22,
    T_Modifier => 23,
    T_Term => 24,
    T_Namespace => 25,
    T_Package => 26,
    T_Class => 27,
    T_Annotation => 28,
    T_RegOpt => 29,
    T_RegPrefix => 30,
    T_RegReplacePrefix => 31,
    T_Ref => 32,
    T_Get => 33,
    T_Set => 34,
    T_Verbose => 35,
    T_Undefined => 36
};

1;
