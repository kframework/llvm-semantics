; ModuleID = './20000422-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ops = global [13 x i32] [i32 11, i32 12, i32 46, i32 3, i32 2, i32 2, i32 3, i32 2, i32 1, i32 3, i32 2, i32 1, i32 2], align 16
@correct = global [13 x i32] [i32 46, i32 12, i32 11, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1], align 16
@num = global i32 13, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %op = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %47, %0
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* @num, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %50

; <label>:6                                       ; preds = %2
  %7 = load i32, i32* @num, align 4
  %8 = sub nsw i32 %7, 1
  store i32 %8, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %43, %6
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %i, align 4
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %46

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %j, align 4
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %16
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %j, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = icmp slt i32 %18, %22
  br i1 %23, label %24, label %42

; <label>:24                                      ; preds = %13
  %25 = load i32, i32* %j, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %26
  %28 = load i32, i32* %27, align 4
  store i32 %28, i32* %op, align 4
  %29 = load i32, i32* %j, align 4
  %30 = sub nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %31
  %33 = load i32, i32* %32, align 4
  %34 = load i32, i32* %j, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %35
  store i32 %33, i32* %36, align 4
  %37 = load i32, i32* %op, align 4
  %38 = load i32, i32* %j, align 4
  %39 = sub nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %40
  store i32 %37, i32* %41, align 4
  br label %42

; <label>:42                                      ; preds = %24, %13
  br label %43

; <label>:43                                      ; preds = %42
  %44 = load i32, i32* %j, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, i32* %j, align 4
  br label %9

; <label>:46                                      ; preds = %9
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32, i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %2

; <label>:50                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %51

; <label>:51                                      ; preds = %67, %50
  %52 = load i32, i32* %i, align 4
  %53 = load i32, i32* @num, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %70

; <label>:55                                      ; preds = %51
  %56 = load i32, i32* %i, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [13 x i32], [13 x i32]* @ops, i32 0, i64 %57
  %59 = load i32, i32* %58, align 4
  %60 = load i32, i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [13 x i32], [13 x i32]* @correct, i32 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = icmp ne i32 %59, %63
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %55
  call void @abort() #2
  unreachable

; <label>:66                                      ; preds = %55
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load i32, i32* %i, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %i, align 4
  br label %51

; <label>:70                                      ; preds = %51
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %72 = load i32, i32* %1
  ret i32 %72
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
