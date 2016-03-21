; ModuleID = './930603-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@w = common global [2 x [2 x i32]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %27

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %20, %4
  %6 = load i32, i32* %j, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %23

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %j, align 4
  %11 = icmp eq i32 %9, %10
  br i1 %11, label %12, label %19

; <label>:12                                      ; preds = %8
  %13 = load i32, i32* %j, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @w, i32 0, i64 %16
  %18 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i32 0, i64 %14
  store i32 1, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %12, %8
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32, i32* %j, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %j, align 4
  br label %5

; <label>:23                                      ; preds = %5
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32, i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %1

; <label>:27                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f()
  %2 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @w, i32 0, i64 0, i64 0), align 4
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %13, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @w, i32 0, i64 1, i64 1), align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %13, label %7

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @w, i32 0, i64 1, i64 0), align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* getelementptr inbounds ([2 x [2 x i32]], [2 x [2 x i32]]* @w, i32 0, i64 0, i64 1), align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10, %7, %4, %0
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %16 = load i32, i32* %1
  ret i32 %16
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
