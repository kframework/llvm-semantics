; ModuleID = './strct-pack-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.TRIAL = type <{ i16, double }>

; Function Attrs: nounwind uwtable
define i32 @check(%struct.TRIAL* %t) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.TRIAL*, align 8
  store %struct.TRIAL* %t, %struct.TRIAL** %2, align 8
  %3 = load %struct.TRIAL** %2, align 8
  %4 = getelementptr inbounds %struct.TRIAL* %3, i32 0, i32 0
  %5 = load i16* %4, align 2
  %6 = sext i16 %5 to i32
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %0
  %9 = load %struct.TRIAL** %2, align 8
  %10 = getelementptr inbounds %struct.TRIAL* %9, i32 0, i32 1
  %11 = load double* %10, align 2
  %12 = fcmp une double %11, 1.600000e+01
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %8, %0
  store i32 1, i32* %1
  br label %15

; <label>:14                                      ; preds = %8
  store i32 0, i32* %1
  br label %15

; <label>:15                                      ; preds = %14, %13
  %16 = load i32* %1
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %trial = alloca %struct.TRIAL, align 2
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.TRIAL* %trial, i32 0, i32 0
  store i16 1, i16* %2, align 2
  %3 = getelementptr inbounds %struct.TRIAL* %trial, i32 0, i32 1
  store double 1.600000e+01, double* %3, align 2
  %4 = call i32 @check(%struct.TRIAL* %trial)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %9 = load i32* %1
  ret i32 %9
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
