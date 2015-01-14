; ModuleID = './20030920-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"\7F\FF\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %hicount = alloca i32, align 4
  %c = alloca i8*, align 8
  %str = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 0, i32* %hicount, align 4
  store i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8** %str, align 8
  %2 = load i8** %str, align 8
  store i8* %2, i8** %c, align 8
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i8** %c, align 8
  %5 = load i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  br i1 %6, label %7, label %19

; <label>:7                                       ; preds = %3
  %8 = load i8** %c, align 8
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ult i32 %10, 128
  br i1 %11, label %15, label %12

; <label>:12                                      ; preds = %7
  %13 = load i32* %hicount, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %hicount, align 4
  br label %15

; <label>:15                                      ; preds = %12, %7
  br label %16

; <label>:16                                      ; preds = %15
  %17 = load i8** %c, align 8
  %18 = getelementptr inbounds i8* %17, i32 1
  store i8* %18, i8** %c, align 8
  br label %3

; <label>:19                                      ; preds = %3
  %20 = load i32* %hicount, align 4
  %21 = icmp ne i32 %20, 1
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %19
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
