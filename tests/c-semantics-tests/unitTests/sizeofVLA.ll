; ModuleID = '/home/david/src/c-semantics/tests/unitTests/sizeofVLA.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"%d should be %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"n is %d\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"n is now %d\0A\00", align 1
@.str3 = private unnamed_addr constant [21 x i8] c"sizeof(int[n]) = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %saved_stack = alloca i8*
  %n = alloca i32, align 4
  %size = alloca i32, align 4
  store i32 5, i32* %x, align 4
  %0 = load i32* %x, align 4
  %1 = zext i32 %0 to i64
  %2 = call i8* @llvm.stacksave()
  store i8* %2, i8** %saved_stack
  %vla = alloca i32, i64 %1, align 16
  %3 = load i32* %x, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32* %x, align 4
  %6 = zext i32 %5 to i64
  %7 = mul nuw i64 %4, %6
  %vla1 = alloca i32, i64 %7, align 16
  store i32 2, i32* %n, align 4
  %8 = mul nuw i64 4, %1
  %div = udiv i64 %8, 4
  %conv = trunc i64 %div to i32
  %9 = load i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %9)
  %10 = load i32* %n, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %10)
  %11 = load i32* %n, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %n, align 4
  %idxprom = sext i32 %11 to i64
  %12 = mul nsw i64 %idxprom, %6
  %arrayidx = getelementptr inbounds i32* %vla1, i64 %12
  %13 = mul nuw i64 4, %6
  %conv3 = trunc i64 %13 to i32
  store i32 %conv3, i32* %size, align 4
  %14 = load i32* %n, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %14)
  %15 = mul nuw i64 %4, %6
  %16 = mul nuw i64 4, %15
  %17 = load i32* %n, align 4
  %inc5 = add nsw i32 %17, 1
  store i32 %inc5, i32* %n, align 4
  %idxprom6 = sext i32 %17 to i64
  %18 = mul nsw i64 %idxprom6, %6
  %arrayidx7 = getelementptr inbounds i32* %vla1, i64 %18
  %19 = mul nuw i64 4, %6
  %div8 = udiv i64 %16, %19
  %conv9 = trunc i64 %div8 to i32
  %20 = load i32* %x, align 4
  %add = add nsw i32 %20, 1
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %conv9, i32 %add)
  %21 = load i32* %n, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %21)
  %22 = load i32* %n, align 4
  %inc12 = add nsw i32 %22, 1
  store i32 %inc12, i32* %n, align 4
  %23 = zext i32 %22 to i64
  %24 = mul nuw i64 4, %23
  %conv13 = trunc i64 %24 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i32 0, i32 0), i32 %conv13)
  %25 = load i32* %n, align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %25)
  %26 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %26)
  ret i32 0
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
