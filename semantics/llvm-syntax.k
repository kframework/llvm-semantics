// Copyright (c) 2013-2014 K Team. All Rights Reserved.
/*@

This is the syntax of LLVM.

This syntax requires a input LLVM program without any comments on it.
*/
module LLVM-SYNTAX

    /*
    Define rules for non-keyword tokens. This is currently just a bunch
    of hacks. They don't cover many valid forms of tokens, and they also
    generate some invalid forms of tokens. 
    */

    syntax HexConstant ::= Token{[0][x][0-9 a-f]*}
    syntax UnsignedInt ::= Token{[1-9][0-9]*}
    syntax FpVal ::= HexConstant | Float
    syntax LocalValID ::= Token{[\%][1-9][0-9]*}
    syntax LocalVar ::=  Token{[\%][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\%]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}

    syntax GlobalValID ::= Token{[\@][1-9][0-9]*}
    syntax GlobalVar ::= Token{[\@][a-z \. \_ \- \$][0-9 a-z \. \_ \- \$]*}
    syntax LocalVar ::= Token{[\@]"\"" ((~[\"\n\r\\]) | (((([\\][nrtf\"\\]) | ([\\][x][0-9a-fA-F][0-9a-fA-F])) | ([\\][u][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])) | ([\\][U][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F])))* "\""}

    syntax LocalName ::= LocalVar | String

endmodule
