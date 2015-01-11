; ModuleID = './2003-05-31-CastToBool.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"y = %d, (y == 2 || y == 0) == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"y = %d, (y > 2 || y < 5) == %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"y = %d, (y ^ 2 ^ ~y) == %d\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"%lld \00", align 1

; Function Attrs: nounwind uwtable
define void @testCastOps(i32 %y) #0 {
  %1 = alloca i32, align 4
  store i32 %y, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = load i32* %1, align 4
  %4 = icmp eq i32 %3, 2
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp eq i32 %6, 0
  br label %8

; <label>:8                                       ; preds = %5, %0
  %9 = phi i1 [ true, %0 ], [ %7, %5 ]
  %10 = zext i1 %9 to i32
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %10)
  %12 = load i32* %1, align 4
  %13 = load i32* %1, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %8
  %16 = load i32* %1, align 4
  %17 = icmp sgt i32 %16, -10
  br label %18

; <label>:18                                      ; preds = %15, %8
  %19 = phi i1 [ false, %8 ], [ %17, %15 ]
  %20 = zext i1 %19 to i32
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %12, i32 %20)
  %22 = load i32* %1, align 4
  %23 = load i32* %1, align 4
  %24 = xor i32 %23, 2
  %25 = xor i32 %24, -6
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %22, i32 %27)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @testBool(i1 zeroext %X) #0 {
  %1 = alloca i8, align 1
  %2 = zext i1 %X to i8
  store i8 %2, i8* %1, align 1
  %3 = load i8* %1, align 1
  %4 = trunc i8 %3 to i1
  %5 = zext i1 %4 to i32
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %5)
  ret void
}

; Function Attrs: nounwind uwtable
define void @testByte(i8 signext %X) #0 {
  %1 = alloca i8, align 1
  store i8 %X, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %3)
  %5 = load i8* %1, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  call void @testBool(i1 zeroext %7)
  ret void
}

; Function Attrs: nounwind uwtable
define void @testShort(i16 signext %X) #0 {
  %1 = alloca i16, align 2
  store i16 %X, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %3)
  %5 = load i16* %1, align 2
  %6 = sext i16 %5 to i32
  %7 = icmp ne i32 %6, 0
  call void @testBool(i1 zeroext %7)
  ret void
}

; Function Attrs: nounwind uwtable
define void @testInt(i32 %X) #0 {
  %1 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %2)
  %4 = load i32* %1, align 4
  %5 = icmp ne i32 %4, 0
  call void @testBool(i1 zeroext %5)
  ret void
}

; Function Attrs: nounwind uwtable
define void @testLong(i64 %X) #0 {
  %1 = alloca i64, align 8
  store i64 %X, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i64 %2)
  %4 = load i64* %1, align 8
  %5 = icmp ne i64 %4, 0
  call void @testBool(i1 zeroext %5)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @testByte(i8 signext 0)
  call void @testByte(i8 signext 123)
  call void @testShort(i16 signext 0)
  call void @testShort(i16 signext 1234)
  call void @testInt(i32 0)
  call void @testInt(i32 1234)
  call void @testLong(i64 0)
  call void @testLong(i64 123121231231231)
  call void @testLong(i64 1230098424783699968)
  call void @testLong(i64 69920)
  call void @testCastOps(i32 2)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
