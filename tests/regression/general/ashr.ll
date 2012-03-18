; ModuleID = 'ashr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
	%foo1 = ashr i32 4, 1   ; yields {i32}:result = 2
	%foo2 = ashr i32 4, 2   ; yields {i32}:result = 1
	%foo3 = ashr i8  4, 3   ; yields {i8}:result = 0
	%foo4 = ashr i8 -2, 1   ; yields {i8}:result = -1
	%foo5 = ashr i32 1, 32  ; undefined
	%res1 = add i32 %foo1, 0
	%res2 = add i32 %foo2, 0
	%res3 = sext i8 %foo3 to i32
	%res4 = sext i8 %foo4 to i32
	%res5 = add i32 %foo5, 0
	%add1 = add i32 %res1, %res2
	%add2 = add i32 %res3, %res4
	%add3 = add i32 %res1, %res2
	%add4 = add i32 %add3, %res5
	ret i32 %add4
}
