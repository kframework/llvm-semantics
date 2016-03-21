; ModuleID = './961223-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { double }

@main.t = private unnamed_addr constant %struct.s { double 2.000000e+00 }, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.s, align 8
  %2 = alloca %struct.s, align 8
  store i32 0, i32* %1
  %3 = bitcast %struct.s* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.s* @main.t to i8*), i64 8, i32 8, i1 false)
  %4 = getelementptr %struct.s, %struct.s* %t, i32 0, i32 0
  %5 = load double, double* %4, align 8
  %6 = call double @sub(double %5)
  %7 = getelementptr %struct.s, %struct.s* %2, i32 0, i32 0
  store double %6, double* %7, align 8
  %8 = bitcast %struct.s* %t to i8*
  %9 = bitcast %struct.s* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 8, i1 false)
  %10 = getelementptr inbounds %struct.s, %struct.s* %t, i32 0, i32 0
  %11 = load double, double* %10, align 8
  %12 = fcmp une double %11, 3.000000e+00
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:14                                      ; preds = %0
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %16 = load i32, i32* %1
  ret i32 %16
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare double @sub(double) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
