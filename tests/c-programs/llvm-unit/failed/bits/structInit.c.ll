; ModuleID = './structInit.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Connection_Type = type { i32, [10 x i8], i32 }

@link = global [3 x %struct.Connection_Type] [%struct.Connection_Type { i32 1, [10 x i8] c"link1\00\00\00\00\00", i32 10 }, %struct.Connection_Type { i32 2, [10 x i8] c"link2\00\00\00\00\00", i32 20 }, %struct.Connection_Type { i32 3, [10 x i8] c"link3\00\00\00\00\00", i32 30 }], align 16
@.str = private unnamed_addr constant [12 x i8] c"%d, %s, %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %l, align 4
  br label %2

; <label>:2                                       ; preds = %22, %0
  %3 = load i32, i32* %l, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %25

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %l, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [3 x %struct.Connection_Type], [3 x %struct.Connection_Type]* @link, i32 0, i64 %7
  %9 = getelementptr inbounds %struct.Connection_Type, %struct.Connection_Type* %8, i32 0, i32 0
  %10 = load i32, i32* %9, align 4
  %11 = load i32, i32* %l, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x %struct.Connection_Type], [3 x %struct.Connection_Type]* @link, i32 0, i64 %12
  %14 = getelementptr inbounds %struct.Connection_Type, %struct.Connection_Type* %13, i32 0, i32 1
  %15 = getelementptr inbounds [10 x i8], [10 x i8]* %14, i32 0, i32 0
  %16 = load i32, i32* %l, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [3 x %struct.Connection_Type], [3 x %struct.Connection_Type]* @link, i32 0, i64 %17
  %19 = getelementptr inbounds %struct.Connection_Type, %struct.Connection_Type* %18, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %10, i8* %15, i32 %20)
  br label %22

; <label>:22                                      ; preds = %5
  %23 = load i32, i32* %l, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %l, align 4
  br label %2

; <label>:25                                      ; preds = %2
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
