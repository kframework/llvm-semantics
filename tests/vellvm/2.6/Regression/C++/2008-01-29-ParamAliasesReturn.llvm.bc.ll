; ModuleID = '2008-01-29-ParamAliasesReturn.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.foo = type { i32, i32, i32, i32 }

@.str = private constant [7 x i8] c"%d %d\0A\00", align 1 ; <[7 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 4, i32 6) ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind
