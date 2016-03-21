; ModuleID = './20050218-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@a = global [16 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], align 16
@.str.4 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1

; Function Attrs: nounwind uwtable
define i32 @foo(i8* %x, i8* %y, i64 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i8* %x, i8** %2, align 8
  store i8* %y, i8** %3, align 8
  store i64 %n, i64* %4, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %i, align 8
  br label %5

; <label>:5                                       ; preds = %38, %0
  %6 = load i64, i64* %i, align 8
  %7 = load i64, i64* %4, align 8
  %8 = icmp ult i64 %6, %7
  br i1 %8, label %9, label %41

; <label>:9                                       ; preds = %5
  %10 = load i8*, i8** %2, align 8
  %11 = load i64, i64* %j, align 8
  %12 = getelementptr inbounds i8, i8* %10, i64 %11
  %13 = load i64, i64* %i, align 8
  %14 = getelementptr inbounds [16 x i8*], [16 x i8*]* @a, i32 0, i64 %13
  %15 = load i8*, i8** %14, align 8
  %16 = load i64, i64* %i, align 8
  %17 = getelementptr inbounds [16 x i8*], [16 x i8*]* @a, i32 0, i64 %16
  %18 = load i8*, i8** %17, align 8
  %19 = call i64 @strlen(i8* %18)
  %20 = call i32 @strncmp(i8* %12, i8* %15, i64 %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %9
  store i32 2, i32* %1
  br label %42

; <label>:23                                      ; preds = %9
  %24 = load i64, i64* %i, align 8
  %25 = getelementptr inbounds [16 x i8*], [16 x i8*]* @a, i32 0, i64 %24
  %26 = load i8*, i8** %25, align 8
  %27 = call i64 @strlen(i8* %26)
  %28 = load i64, i64* %j, align 8
  %29 = add i64 %28, %27
  store i64 %29, i64* %j, align 8
  %30 = load i8*, i8** %3, align 8
  %31 = icmp ne i8* %30, null
  br i1 %31, label %32, label %37

; <label>:32                                      ; preds = %23
  %33 = load i8*, i8** %3, align 8
  %34 = call i64 @strlen(i8* %33)
  %35 = load i64, i64* %j, align 8
  %36 = add i64 %35, %34
  store i64 %36, i64* %j, align 8
  br label %37

; <label>:37                                      ; preds = %32, %23
  br label %38

; <label>:38                                      ; preds = %37
  %39 = load i64, i64* %i, align 8
  %40 = add i64 %39, 1
  store i64 %40, i64* %i, align 8
  br label %5

; <label>:41                                      ; preds = %5
  store i32 0, i32* %1
  br label %42

; <label>:42                                      ; preds = %41, %22
  %43 = load i32, i32* %1
  ret i32 %43
}

declare i32 @strncmp(i8*, i8*, i64) #1

declare i64 @strlen(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i8* null, i64 3)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
