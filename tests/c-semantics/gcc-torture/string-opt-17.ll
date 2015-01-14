; ModuleID = './string-opt-17.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"foobarbaz\00", align 1
@check2.r = internal global i64 5, align 8
@.str1 = private unnamed_addr constant [3 x i8] c"az\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"baz\00", align 1

; Function Attrs: nounwind uwtable
define i64 @test1(i8* %s, i64 %i) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %s, i8** %1, align 8
  store i64 %i, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = load i64* %2, align 8
  %5 = add i64 %4, 1
  store i64 %5, i64* %2, align 8
  %6 = getelementptr inbounds i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i64 %4
  %7 = call i8* @strcpy(i8* %3, i8* %6)
  %8 = load i64* %2, align 8
  ret i64 %8
}

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i64 @check2() #0 {
  %1 = load i64* @check2.r, align 8
  %2 = icmp ne i64 %1, 5
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:4                                       ; preds = %0
  %5 = load i64* @check2.r, align 8
  %6 = add i64 %5, 1
  store i64 %6, i64* @check2.r, align 8
  ret i64 %6
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @test2(i8* %s) #0 {
  %1 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = call i64 @check2()
  %4 = getelementptr inbounds i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i64 %3
  %5 = call i8* @strcpy(i8* %2, i8* %4)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %buf = alloca [10 x i8], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  %3 = call i64 @test1(i8* %2, i64 7)
  %4 = icmp ne i64 %3, 8
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  %7 = call i32 @memcmp(i8* %6, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i64 3)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5, %0
  call void @abort() #3
  unreachable

; <label>:10                                      ; preds = %5
  %11 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  call void @test2(i8* %11)
  %12 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  %13 = call i32 @memcmp(i8* %12, i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i64 4)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  call void @abort() #3
  unreachable

; <label>:16                                      ; preds = %10
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %18 = load i32* %1
  ret i32 %18
}

declare i32 @memcmp(i8*, i8*, i64) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
