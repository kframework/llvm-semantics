; ModuleID = './20050929-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { %struct.A*, %struct.A* }
%struct.C = type { %struct.B*, %struct.A* }

@.compoundliteral = internal global %struct.A { i32 1, i32 2 }
@.compoundliteral1 = internal global %struct.A { i32 3, i32 4 }
@.compoundliteral2 = internal global %struct.B { %struct.A* @.compoundliteral, %struct.A* @.compoundliteral1 }
@.compoundliteral3 = internal global %struct.A { i32 5, i32 6 }
@e = global %struct.C { %struct.B* @.compoundliteral2, %struct.A* @.compoundliteral3 }, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %3 = getelementptr inbounds %struct.B* %2, i32 0, i32 0
  %4 = load %struct.A** %3, align 8
  %5 = getelementptr inbounds %struct.A* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %10 = getelementptr inbounds %struct.B* %9, i32 0, i32 0
  %11 = load %struct.A** %10, align 8
  %12 = getelementptr inbounds %struct.A* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = icmp ne i32 %13, 2
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8, %0
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %8
  %17 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %18 = getelementptr inbounds %struct.B* %17, i32 0, i32 1
  %19 = load %struct.A** %18, align 8
  %20 = getelementptr inbounds %struct.A* %19, i32 0, i32 0
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 3
  br i1 %22, label %30, label %23

; <label>:23                                      ; preds = %16
  %24 = load %struct.B** getelementptr inbounds (%struct.C* @e, i32 0, i32 0), align 8
  %25 = getelementptr inbounds %struct.B* %24, i32 0, i32 1
  %26 = load %struct.A** %25, align 8
  %27 = getelementptr inbounds %struct.A* %26, i32 0, i32 1
  %28 = load i32* %27, align 4
  %29 = icmp ne i32 %28, 4
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %23, %16
  call void @abort() #2
  unreachable

; <label>:31                                      ; preds = %23
  %32 = load %struct.A** getelementptr inbounds (%struct.C* @e, i32 0, i32 1), align 8
  %33 = getelementptr inbounds %struct.A* %32, i32 0, i32 0
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 5
  br i1 %35, label %41, label %36

; <label>:36                                      ; preds = %31
  %37 = load %struct.A** getelementptr inbounds (%struct.C* @e, i32 0, i32 1), align 8
  %38 = getelementptr inbounds %struct.A* %37, i32 0, i32 1
  %39 = load i32* %38, align 4
  %40 = icmp ne i32 %39, 6
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %36, %31
  call void @abort() #2
  unreachable

; <label>:42                                      ; preds = %36
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
