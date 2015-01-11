; ModuleID = './20040411-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @sub1(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %x = alloca [10 x i32], align 16
  %y = alloca [10 x i32], align 16
  store i32 %i, i32* %2, align 4
  store i32 %j, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = add nsw i32 %4, 2
  %6 = zext i32 %5 to i64
  %7 = load i32* %3, align 4
  %8 = icmp eq i32 %7, 2
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %0
  %10 = bitcast [10 x i32]* %x to i8*
  %11 = bitcast [10 x i32]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 40, i32 16, i1 false)
  %12 = mul nuw i64 4, %6
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %1
  br label %18

; <label>:14                                      ; preds = %0
  %15 = mul nuw i64 4, %6
  %16 = mul i64 %15, 3
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %1
  br label %18

; <label>:18                                      ; preds = %14, %9
  %19 = load i32* %1
  ret i32 %19
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @sub1(i32 20, i32 3)
  %3 = sext i32 %2 to i64
  %4 = icmp ne i64 %3, 264
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
