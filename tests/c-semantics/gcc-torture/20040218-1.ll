; ModuleID = './20040218-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.y = private unnamed_addr constant [2 x i64] [i64 -1, i64 16000], align 16
@main.yw = private unnamed_addr constant [2 x i16] [i16 -1, i16 16000], align 2

; Function Attrs: noinline nounwind uwtable
define i64 @xb(i64* %y) #0 {
  %1 = alloca i64*, align 8
  %xx = alloca i64, align 8
  store i64* %y, i64** %1, align 8
  %2 = load i64** %1, align 8
  %3 = load i64* %2, align 8
  %4 = and i64 %3, 255
  store i64 %4, i64* %xx, align 8
  %5 = load i64* %xx, align 8
  %6 = load i64** %1, align 8
  %7 = getelementptr inbounds i64* %6, i64 1
  %8 = load i64* %7, align 8
  %9 = add nsw i64 %5, %8
  ret i64 %9
}

; Function Attrs: noinline nounwind uwtable
define i64 @xw(i64* %y) #0 {
  %1 = alloca i64*, align 8
  %xx = alloca i64, align 8
  store i64* %y, i64** %1, align 8
  %2 = load i64** %1, align 8
  %3 = load i64* %2, align 8
  %4 = and i64 %3, 65535
  store i64 %4, i64* %xx, align 8
  %5 = load i64* %xx, align 8
  %6 = load i64** %1, align 8
  %7 = getelementptr inbounds i64* %6, i64 1
  %8 = load i64* %7, align 8
  %9 = add nsw i64 %5, %8
  ret i64 %9
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @yb(i16* %y) #0 {
  %1 = alloca i16*, align 8
  %xx = alloca i16, align 2
  store i16* %y, i16** %1, align 8
  %2 = load i16** %1, align 8
  %3 = load i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = and i32 %4, 255
  %6 = trunc i32 %5 to i16
  store i16 %6, i16* %xx, align 2
  %7 = load i16* %xx, align 2
  %8 = sext i16 %7 to i32
  %9 = load i16** %1, align 8
  %10 = getelementptr inbounds i16* %9, i64 1
  %11 = load i16* %10, align 2
  %12 = sext i16 %11 to i32
  %13 = add nsw i32 %8, %12
  %14 = trunc i32 %13 to i16
  ret i16 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %y = alloca [2 x i64], align 16
  %yw = alloca [2 x i16], align 2
  store i32 0, i32* %1
  %2 = bitcast [2 x i64]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x i64]* @main.y to i8*), i64 16, i32 16, i1 false)
  %3 = bitcast [2 x i16]* %yw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([2 x i16]* @main.yw to i8*), i64 4, i32 2, i1 false)
  %4 = getelementptr inbounds [2 x i64]* %y, i32 0, i32 0
  %5 = call i64 @xb(i64* %4)
  %6 = icmp ne i64 %5, 16255
  br i1 %6, label %16, label %7

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds [2 x i64]* %y, i32 0, i32 0
  %9 = call i64 @xw(i64* %8)
  %10 = icmp ne i64 %9, 81535
  br i1 %10, label %16, label %11

; <label>:11                                      ; preds = %7
  %12 = getelementptr inbounds [2 x i16]* %yw, i32 0, i32 0
  %13 = call signext i16 @yb(i16* %12)
  %14 = sext i16 %13 to i32
  %15 = icmp ne i32 %14, 16255
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11, %7, %0
  call void @abort() #4
  unreachable

; <label>:17                                      ; preds = %11
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %19 = load i32* %1
  ret i32 %19
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
