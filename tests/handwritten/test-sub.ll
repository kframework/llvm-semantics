target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"
declare void @__fsl.print.i2(i2)
define void @f() nounwind uwtable {
	%test0 = sub i2 0, 0
	call void @__fsl.print.i2(i2 %test0)
	%test1 = sub i2 0, 1
	call void @__fsl.print.i2(i2 %test1)
	%test2 = sub i2 0, 2
	call void @__fsl.print.i2(i2 %test2)
	%test3 = sub i2 0, 3
	call void @__fsl.print.i2(i2 %test3)
	%test4 = sub i2 1, 0
	call void @__fsl.print.i2(i2 %test4)
	%test5 = sub i2 1, 1
	call void @__fsl.print.i2(i2 %test5)
	%test6 = sub i2 1, 2
	call void @__fsl.print.i2(i2 %test6)
	%test7 = sub i2 1, 3
	call void @__fsl.print.i2(i2 %test7)
	%test8 = sub i2 2, 0
	call void @__fsl.print.i2(i2 %test8)
	%test9 = sub i2 2, 1
	call void @__fsl.print.i2(i2 %test9)
	%test10 = sub i2 2, 2
	call void @__fsl.print.i2(i2 %test10)
	%test11 = sub i2 2, 3
	call void @__fsl.print.i2(i2 %test11)
	%test12 = sub i2 3, 0
	call void @__fsl.print.i2(i2 %test12)
	%test13 = sub i2 3, 1
	call void @__fsl.print.i2(i2 %test13)
	%test14 = sub i2 3, 2
	call void @__fsl.print.i2(i2 %test14)
	%test15 = sub i2 3, 3
	call void @__fsl.print.i2(i2 %test15)
	ret void
}
define i32 @main() nounwind uwtable {
	call void @f()
	ret i32 0
}
