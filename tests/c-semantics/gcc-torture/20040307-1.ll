; ModuleID = './20040307-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i8, [3 x i8] }

@main.sdata = private unnamed_addr constant %struct.anon { i8 1, [3 x i8] undef }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %b = alloca i32, align 4
  %sdata = alloca %struct.anon, align 4
  store i32 0, i32* %1
  store i32 0, i32* %b, align 4
  %2 = bitcast %struct.anon* %sdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds (%struct.anon* @main.sdata, i32 0, i32 0), i64 4, i32 4, i1 false)
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = bitcast %struct.anon* %sdata to i8*
  %5 = load i8* %4, align 4
  %6 = and i8 %5, 1
  %7 = zext i8 %6 to i32
  %8 = add i32 %7, -1
  %9 = trunc i32 %8 to i8
  %10 = load i8* %4, align 4
  %11 = and i8 %9, 1
  %12 = and i8 %10, -2
  %13 = or i8 %12, %11
  store i8 %13, i8* %4, align 4
  %14 = zext i8 %11 to i32
  %15 = icmp ugt i32 %7, 0
  br i1 %15, label %16, label %23

; <label>:16                                      ; preds = %3
  %17 = load i32* %b, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %b, align 4
  %19 = load i32* %b, align 4
  %20 = icmp sgt i32 %19, 100
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %16
  br label %23

; <label>:22                                      ; preds = %16
  br label %3

; <label>:23                                      ; preds = %21, %3
  %24 = load i32* %b, align 4
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23
  call void @abort() #3
  unreachable

; <label>:27                                      ; preds = %23
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
