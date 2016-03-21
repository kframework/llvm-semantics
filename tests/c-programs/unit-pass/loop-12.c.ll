; ModuleID = './loop-12.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@p = common global i8* null, align 8
@.str = private unnamed_addr constant [5 x i8] c"abc\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  br label %1

; <label>:1                                       ; preds = %5, %0
  %2 = call i32 @is_end_of_statement() #2
  %3 = icmp ne i32 %2, 0
  %4 = xor i1 %3, true
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %1
  %6 = load i8*, i8** @p, align 8
  %7 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %7, i8** @p, align 8
  br label %1

; <label>:8                                       ; preds = %1
  ret void
}

; Function Attrs: nounwind readonly uwtable
define internal i32 @is_end_of_statement() #1 {
  %1 = load i8*, i8** @p, align 8
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = icmp eq i32 %3, 10
  br i1 %4, label %15, label %5

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** @p, align 8
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, 59
  br i1 %9, label %15, label %10

; <label>:10                                      ; preds = %5
  %11 = load i8*, i8** @p, align 8
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 33
  br label %15

; <label>:15                                      ; preds = %10, %5, %0
  %16 = phi i1 [ true, %5 ], [ true, %0 ], [ %14, %10 ]
  %17 = zext i1 %16 to i32
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8** @p, align 8
  call void @foo()
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
