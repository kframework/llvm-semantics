; ModuleID = './20060905-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@s = common global [256 x [3 x i8]] zeroinitializer, align 16
@g = common global i8 0, align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 128
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @foo() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %20, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 256
  br i1 %3, label %4, label %23

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %i, align 4
  %6 = icmp sge i32 %5, 128
  br i1 %6, label %7, label %19

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = icmp slt i32 %8, 256
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %i, align 4
  %12 = sub nsw i32 %11, 128
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [256 x [3 x i8]], [256 x [3 x i8]]* @s, i32 0, i64 %13
  %15 = getelementptr inbounds [3 x i8], [3 x i8]* %14, i32 0, i64 0
  %16 = load volatile i8, i8* %15, align 1
  call void @dummy(i8 signext %16)
  %17 = load i32, i32* %j, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %j, align 4
  br label %19

; <label>:19                                      ; preds = %10, %7, %4
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32, i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %1

; <label>:23                                      ; preds = %1
  %24 = load i32, i32* %j, align 4
  ret i32 %24
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal void @dummy(i8 signext %a) #0 {
  %1 = alloca i8, align 1
  store i8 %a, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  store i8 %2, i8* @g, align 1
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
