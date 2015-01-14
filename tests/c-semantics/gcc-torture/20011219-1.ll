; ModuleID = './20011219-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"foo\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"bar\00", align 1

; Function Attrs: nounwind uwtable
define void @bar(i8* %x, i32 %y, i8* %z) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i8* %x, i8** %1, align 8
  store i32 %y, i32* %2, align 4
  store i8* %z, i8** %3, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @foo(i32 %x, i8* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %a = alloca i64, align 8
  store i32 %x, i32* %1, align 4
  store i8* %y, i8** %2, align 8
  %3 = load i32* %1, align 4
  switch i32 %3, label %24 [
    i32 10, label %4
    i32 11, label %8
    i32 12, label %12
    i32 13, label %16
    i32 14, label %20
  ]

; <label>:4                                       ; preds = %0
  %5 = load i8** %2, align 8
  %6 = bitcast i8* %5 to i64*
  %7 = load i64* %6, align 8
  store i64 %7, i64* %a, align 8
  br label %25

; <label>:8                                       ; preds = %0
  %9 = load i8** %2, align 8
  %10 = bitcast i8* %9 to i64*
  %11 = load i64* %10, align 8
  store i64 %11, i64* %a, align 8
  br label %25

; <label>:12                                      ; preds = %0
  %13 = load i8** %2, align 8
  %14 = bitcast i8* %13 to i64*
  %15 = load i64* %14, align 8
  store i64 %15, i64* %a, align 8
  br label %25

; <label>:16                                      ; preds = %0
  %17 = load i8** %2, align 8
  %18 = bitcast i8* %17 to i64*
  %19 = load i64* %18, align 8
  store i64 %19, i64* %a, align 8
  br label %25

; <label>:20                                      ; preds = %0
  %21 = load i8** %2, align 8
  %22 = bitcast i8* %21 to i64*
  %23 = load i64* %22, align 8
  store i64 %23, i64* %a, align 8
  br label %25

; <label>:24                                      ; preds = %0
  call void @bar(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 1, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %25

; <label>:25                                      ; preds = %24, %20, %16, %12, %8, %4
  %26 = load i64* %a, align 8
  ret i64 %26
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 0, i32* %1
  store i64 24, i64* %i, align 8
  %2 = bitcast i64* %i to i8*
  %3 = call i64 @foo(i32 13, i8* %2)
  %4 = icmp ne i64 %3, 24
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
