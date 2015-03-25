; ModuleID = './20050502-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.x = private unnamed_addr constant [11 x i8] c"IJKLMNOPQR\00", align 1
@.str = private unnamed_addr constant [11 x i8] c"IJKL\00NOPQR\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"IJKLMNOP\00R\00", align 1

; Function Attrs: nounwind uwtable
define void @foo(i8* %x) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %x, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %2
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %i, align 4
  br label %2

; <label>:9                                       ; preds = %2
  %10 = load i32* %i, align 4
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = load i8** %1, align 8
  %15 = getelementptr inbounds i8* %14, i64 %13
  store i8 0, i8* %15, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(i8* %x) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %x, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %2
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load i32* %i, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %i, align 4
  br label %2

; <label>:9                                       ; preds = %2
  %10 = load i32* %i, align 4
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %10, %11
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %12, %13
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %14, %15
  %17 = sext i32 %16 to i64
  %18 = load i8** %1, align 8
  %19 = getelementptr inbounds i8* %18, i64 %17
  store i8 0, i8* %19, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [11 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [11 x i8]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([11 x i8]* @main.x, i32 0, i32 0), i64 11, i32 1, i1 false)
  %3 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  call void @foo(i8* %3)
  %4 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  %5 = call i32 @memcmp(i8* %4, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i64 11)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds [11 x i8]* %x, i32 0, i64 4
  store i8 77, i8* %9, align 1
  %10 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  call void @bar(i8* %10)
  %11 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  %12 = call i32 @memcmp(i8* %11, i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i64 11)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  call void @abort() #4
  unreachable

; <label>:15                                      ; preds = %8
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @memcmp(i8*, i8*, i64) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
