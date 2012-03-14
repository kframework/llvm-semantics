; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"ee\00", align 1

define i32 @main() nounwind uwtable {
entry:
	%foo = load i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)
	%bar = zext i8 %foo to i32
	ret i32 %bar
}
