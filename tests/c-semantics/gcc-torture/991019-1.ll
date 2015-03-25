; ModuleID = './991019-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.material_type = type { double }

; Function Attrs: nounwind uwtable
define double @foo(double %x) #0 {
  %1 = alloca %struct.material_type, align 8
  %2 = alloca double, align 8
  %m = alloca %struct.material_type, align 8
  store double %x, double* %2, align 8
  %3 = load double* %2, align 8
  %4 = fadd double 1.000000e+00, %3
  %5 = getelementptr inbounds %struct.material_type* %m, i32 0, i32 0
  store double %4, double* %5, align 8
  %6 = bitcast %struct.material_type* %1 to i8*
  %7 = bitcast %struct.material_type* %m to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 8, i1 false)
  %8 = getelementptr %struct.material_type* %1, i32 0, i32 0
  %9 = load double* %8, align 1
  ret double %9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.material_type, align 8
  %2 = alloca %struct.material_type, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %19

; <label>:6                                       ; preds = %3
  %7 = call double @foo(double 1.000000e+00)
  %8 = getelementptr %struct.material_type* %2, i32 0, i32 0
  store double %7, double* %8, align 1
  %9 = bitcast %struct.material_type* %x to i8*
  %10 = bitcast %struct.material_type* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 8, i32 8, i1 false)
  %11 = getelementptr inbounds %struct.material_type* %x, i32 0, i32 0
  %12 = load double* %11, align 8
  %13 = fcmp une double %12, 2.000000e+00
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %6
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %6
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:19                                      ; preds = %3
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %21 = load i32* %1
  ret i32 %21
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
