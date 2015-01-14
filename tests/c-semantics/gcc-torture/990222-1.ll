; ModuleID = './990222-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@line = global [4 x i8] c"199\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %ptr = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 3), i8** %ptr, align 8
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i8** %ptr, align 8
  %4 = getelementptr inbounds i8* %3, i32 -1
  store i8* %4, i8** %ptr, align 8
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %6, 1
  %8 = trunc i32 %7 to i8
  store i8 %8, i8* %4, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp sgt i32 %9, 57
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %2
  %12 = load i8** %ptr, align 8
  store i8 48, i8* %12, align 1
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 0), align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 50
  br i1 %16, label %25, label %17

; <label>:17                                      ; preds = %13
  %18 = load i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 1), align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 48
  br i1 %20, label %25, label %21

; <label>:21                                      ; preds = %17
  %22 = load i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 2), align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 48
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %21, %17, %13
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %21
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
