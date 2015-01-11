; ModuleID = './20021024-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@cp = common global i64* null, align 8
@m = common global i64 0, align 8
@main.r = internal global [64 x i64] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(i32 %rop, i64* %r) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64*, align 8
  %rs1 = alloca i32, align 4
  %rs2 = alloca i32, align 4
  %rd = alloca i32, align 4
  store i32 %rop, i32* %1, align 4
  store i64* %r, i64** %2, align 8
  br label %3

; <label>:3                                       ; preds = %27, %0
  %4 = load i32* %1, align 4
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 511
  store i32 %6, i32* %rs2, align 4
  %7 = load i32* %1, align 4
  %8 = lshr i32 %7, 9
  %9 = and i32 %8, 511
  store i32 %9, i32* %rs1, align 4
  %10 = load i32* %1, align 4
  %11 = and i32 %10, 511
  store i32 %11, i32* %rd, align 4
  %12 = load i64** @cp, align 8
  store i64 1, i64* %12, align 8
  %13 = load i32* %rs1, align 4
  %14 = zext i32 %13 to i64
  %15 = load i64** %2, align 8
  %16 = getelementptr inbounds i64* %15, i64 %14
  %17 = load i64* %16, align 8
  %18 = load i32* %rs2, align 4
  %19 = zext i32 %18 to i64
  %20 = load i64** %2, align 8
  %21 = getelementptr inbounds i64* %20, i64 %19
  %22 = load i64* %21, align 8
  %23 = add i64 %17, %22
  store i64 %23, i64* @m, align 8
  %24 = load i64** @cp, align 8
  store i64 2, i64* %24, align 8
  call void @foo()
  %25 = load i32* %rd, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %28, label %27

; <label>:27                                      ; preds = %3
  br label %3

; <label>:28                                      ; preds = %3
  %29 = load i32* %rd, align 4
  %30 = zext i32 %29 to i64
  %31 = load i64** %2, align 8
  %32 = getelementptr inbounds i64* %31, i64 %30
  store i64 1, i64* %32, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %cr = alloca i64, align 8
  store i32 0, i32* %1
  store i64* %cr, i64** @cp, align 8
  store i64 47, i64* getelementptr inbounds ([64 x i64]* @main.r, i32 0, i64 4), align 8
  store i64 11, i64* getelementptr inbounds ([64 x i64]* @main.r, i32 0, i64 8), align 8
  call void @bar(i32 67110927, i64* getelementptr inbounds ([64 x i64]* @main.r, i32 0, i32 0))
  %2 = load i64* @m, align 8
  %3 = icmp ne i64 %2, 58
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
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
