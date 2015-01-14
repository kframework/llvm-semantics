; ModuleID = './930603-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i8* %b, i32 %c) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %v = alloca i64, align 8
  store i8* %b, i8** %1, align 8
  store i32 %c, i32* %2, align 4
  store i64 0, i64* %v, align 8
  %3 = load i32* %2, align 4
  switch i32 %3, label %24 [
    i32 100, label %4
    i32 107, label %17
  ]

; <label>:4                                       ; preds = %0
  %5 = load i8** %1, align 8
  %6 = getelementptr inbounds i8* %5, i64 0
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i64
  %9 = shl i64 %8, 8
  %10 = load i8** %1, align 8
  %11 = getelementptr inbounds i8* %10, i64 1
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i64
  %14 = add i64 %9, %13
  store i64 %14, i64* %v, align 8
  %15 = load i64* %v, align 8
  %16 = lshr i64 %15, 9
  store i64 %16, i64* %v, align 8
  br label %25

; <label>:17                                      ; preds = %0
  %18 = load i8** %1, align 8
  %19 = getelementptr inbounds i8* %18, i64 3
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = ashr i32 %21, 4
  %23 = sext i32 %22 to i64
  store i64 %23, i64* %v, align 8
  br label %25

; <label>:24                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %17, %4
  %26 = load i64* %v, align 8
  %27 = trunc i64 %26 to i32
  ret i32 %27
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %buf = alloca [4 x i8], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [4 x i8]* %buf, i32 0, i64 0
  store i8 -86, i8* %2, align 1
  %3 = getelementptr inbounds [4 x i8]* %buf, i32 0, i64 1
  store i8 5, i8* %3, align 1
  %4 = getelementptr inbounds [4 x i8]* %buf, i32 0, i32 0
  %5 = call i32 @f(i8* %4, i32 100)
  %6 = icmp ne i32 %5, 85
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32* %1
  ret i32 %10
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
