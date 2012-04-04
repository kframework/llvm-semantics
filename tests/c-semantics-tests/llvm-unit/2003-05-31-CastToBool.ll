; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-05-31-CastToBool.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"y = %d, (y == 2 || y == 0) == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"y = %d, (y > 2 || y < 5) == %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"y = %d, (y ^ 2 ^ ~y) == %d\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"%lld \00", align 1

define void @testCastOps(i32 %y) nounwind uwtable {
entry:
  %y.addr = alloca i32, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %y.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %1, 2
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i32* %y.addr, align 4
  %cmp1 = icmp eq i32 %2, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %3 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %3 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %lor.ext)
  %4 = load i32* %y.addr, align 4
  %5 = load i32* %y.addr, align 4
  %cmp2 = icmp slt i32 %5, 2
  br i1 %cmp2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  %6 = load i32* %y.addr, align 4
  %cmp3 = icmp sgt i32 %6, -10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %7 = phi i1 [ false, %lor.end ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %4, i32 %land.ext)
  %8 = load i32* %y.addr, align 4
  %9 = load i32* %y.addr, align 4
  %xor = xor i32 %9, 2
  %xor5 = xor i32 %xor, -6
  %tobool = icmp ne i32 %xor5, 0
  %conv = zext i1 %tobool to i32
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 %8, i32 %conv)
  ret void
}

declare i32 @printf(i8*, ...)

define void @testBool(i1 zeroext %X) nounwind uwtable {
entry:
  %X.addr = alloca i8, align 1
  %frombool = zext i1 %X to i8
  store i8 %frombool, i8* %X.addr, align 1
  %0 = load i8* %X.addr, align 1
  %tobool = trunc i8 %0 to i1
  %conv = zext i1 %tobool to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %conv)
  ret void
}

define void @testByte(i8 signext %X) nounwind uwtable {
entry:
  %X.addr = alloca i8, align 1
  store i8 %X, i8* %X.addr, align 1
  %0 = load i8* %X.addr, align 1
  %conv = sext i8 %0 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %conv)
  %1 = load i8* %X.addr, align 1
  %conv1 = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv1, 0
  call void @testBool(i1 zeroext %cmp)
  ret void
}

define void @testShort(i16 signext %X) nounwind uwtable {
entry:
  %X.addr = alloca i16, align 2
  store i16 %X, i16* %X.addr, align 2
  %0 = load i16* %X.addr, align 2
  %conv = sext i16 %0 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %conv)
  %1 = load i16* %X.addr, align 2
  %conv1 = sext i16 %1 to i32
  %cmp = icmp ne i32 %conv1, 0
  call void @testBool(i1 zeroext %cmp)
  ret void
}

define void @testInt(i32 %X) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  %0 = load i32* %X.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i32 %0)
  %1 = load i32* %X.addr, align 4
  %cmp = icmp ne i32 %1, 0
  call void @testBool(i1 zeroext %cmp)
  ret void
}

define void @testLong(i64 %X) nounwind uwtable {
entry:
  %X.addr = alloca i64, align 8
  store i64 %X, i64* %X.addr, align 8
  %0 = load i64* %X.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i64 %0)
  %1 = load i64* %X.addr, align 8
  %cmp = icmp ne i64 %1, 0
  call void @testBool(i1 zeroext %cmp)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
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
