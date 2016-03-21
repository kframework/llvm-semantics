; ModuleID = './20020213-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { float, i32 }

@a = common global %struct.A zeroinitializer, align 4
@b = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  %1 = load float, float* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 0), align 4
  %2 = call i32 @bar(float %1)
  store i32 %2, i32* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 1), align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 1), align 4
  %4 = load i32, i32* @b, align 4
  %5 = sub nsw i32 %4, 1
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 1), align 4
  br label %12

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* @b, align 4
  %11 = sub nsw i32 %10, 1
  br label %12

; <label>:12                                      ; preds = %9, %7
  %13 = phi i32 [ %8, %7 ], [ %11, %9 ]
  store i32 %13, i32* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 1), align 4
  %14 = load i32, i32* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 1), align 4
  %15 = load i32, i32* @b, align 4
  %16 = sub nsw i32 %15, 1
  %17 = icmp sge i32 %14, %16
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %12
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %12
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bar(float %x) #0 {
  %1 = alloca float, align 4
  store float %x, float* %1, align 4
  ret i32 2241
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store float 1.000000e+00, float* getelementptr inbounds (%struct.A, %struct.A* @a, i32 0, i32 0), align 4
  store i32 3384, i32* @b, align 4
  call void @foo()
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
