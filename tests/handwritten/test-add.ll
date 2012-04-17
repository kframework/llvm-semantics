target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

declare void @__fsl.print.i2(i2)

declare void @__fsl.print.i8(i8)

define i32 @main() nounwind uwtable {
entry:
	%val00 = add i2 0, 0
	call void @__fsl.print.i2(i2 %val00) ; 0 = 0 = 0
	%val01 = add i2 1, 0
	call void @__fsl.print.i2(i2 %val01) ; 1 = 1 = 1
	%val02 = add i2 2, 0
	call void @__fsl.print.i2(i2 %val02) ; 2 = 2 = -2
	%val03 = add i2 3, 0
	call void @__fsl.print.i2(i2 %val03) ; 3 = 3 = -1
	%val04 = add i2 0, 1
	call void @__fsl.print.i2(i2 %val04) ; 1 = 1 = 1
	%val05 = add i2 1, 1
	call void @__fsl.print.i2(i2 %val05) ; 2 = 2 = -2
	%val06 = add i2 2, 1
	call void @__fsl.print.i2(i2 %val06) ; 3 = 3 = -1
	%val07 = add i2 3, 1
	call void @__fsl.print.i2(i2 %val07) ; 4 = 0 = 0
	%val08 = add i2 0, 2
	call void @__fsl.print.i2(i2 %val08) ; 2 = 2 = -2
	%val09 = add i2 1, 2
	call void @__fsl.print.i2(i2 %val09) ; 3 = 3 = -1
	%val10 = add i2 2, 2
	call void @__fsl.print.i2(i2 %val10) ; 4 = 0 = 0
	%val11 = add i2 3, 2
	call void @__fsl.print.i2(i2 %val11) ; 5 = 1 = 1
	%val12 = add i2 0, 3
	call void @__fsl.print.i2(i2 %val12) ; 3 = 3 = -1
	%val13 = add i2 1, 3
	call void @__fsl.print.i2(i2 %val13) ; 4 = 0 = 0
	%val14 = add i2 2, 3
	call void @__fsl.print.i2(i2 %val14) ; 5 = 1 = 1
	%val15 = add i2 3, 3
	call void @__fsl.print.i2(i2 %val15) ; 6 = 2 = -2
	
	ret i32 0
}
