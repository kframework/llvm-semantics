; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
	%p1 = add i64 207374157, 107374157
	%q1 = trunc i64 %p1 to i8
	%q2 = zext i8 %q1 to i32
	ret i32 %q2
}
