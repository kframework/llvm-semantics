; ModuleID = './20000801-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i8* %bp, i32 %n) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %c = alloca i8, align 1
  %ep = alloca i8*, align 8
  %sp = alloca i8*, align 8
  store i8* %bp, i8** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load i8** %1, align 8
  %4 = load i32* %2, align 4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i8* %3, i64 %5
  store i8* %6, i8** %ep, align 8
  br label %7

; <label>:7                                       ; preds = %11, %0
  %8 = load i8** %1, align 8
  %9 = load i8** %ep, align 8
  %10 = icmp ult i8* %8, %9
  br i1 %10, label %11, label %34

; <label>:11                                      ; preds = %7
  %12 = load i8** %1, align 8
  %13 = getelementptr inbounds i8* %12, i64 3
  store i8* %13, i8** %sp, align 8
  %14 = load i8** %sp, align 8
  %15 = load i8* %14, align 1
  store i8 %15, i8* %c, align 1
  %16 = load i8** %1, align 8
  %17 = load i8* %16, align 1
  %18 = load i8** %sp, align 8
  store i8 %17, i8* %18, align 1
  %19 = load i8* %c, align 1
  %20 = load i8** %1, align 8
  %21 = getelementptr inbounds i8* %20, i32 1
  store i8* %21, i8** %1, align 8
  store i8 %19, i8* %20, align 1
  %22 = load i8** %1, align 8
  %23 = getelementptr inbounds i8* %22, i64 1
  store i8* %23, i8** %sp, align 8
  %24 = load i8** %sp, align 8
  %25 = load i8* %24, align 1
  store i8 %25, i8* %c, align 1
  %26 = load i8** %1, align 8
  %27 = load i8* %26, align 1
  %28 = load i8** %sp, align 8
  store i8 %27, i8* %28, align 1
  %29 = load i8* %c, align 1
  %30 = load i8** %1, align 8
  %31 = getelementptr inbounds i8* %30, i32 1
  store i8* %31, i8** %1, align 8
  store i8 %29, i8* %30, align 1
  %32 = load i8** %1, align 8
  %33 = getelementptr inbounds i8* %32, i64 2
  store i8* %33, i8** %1, align 8
  br label %7

; <label>:34                                      ; preds = %7
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %one = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %one, align 4
  %2 = bitcast i32* %one to i8*
  call void @foo(i8* %2, i32 4)
  %3 = bitcast i32* %one to i8*
  call void @foo(i8* %3, i32 4)
  %4 = load i32* %one, align 4
  %5 = icmp ne i32 %4, 1
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

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
