; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/sizeofVLA.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"%d should be %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"n is %d\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"n is now %d\0A\00", align 1
@.str3 = private unnamed_addr constant [21 x i8] c"sizeof(int[n]) = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %saved_stack = alloca i8*
  %n = alloca i32, align 4
  %size = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  %0 = call i8* @llvm.stacksave()
  store i8* %0, i8** %saved_stack
  %tmp = load i32* %x, align 4
  %tmp1 = zext i32 %tmp to i64
  %1 = mul i64 4, %tmp1
  %vla = alloca i8, i64 %1, align 16
  %tmp2 = bitcast i8* %vla to i32*
  %tmp3 = load i32* %x, align 4
  %tmp4 = zext i32 %tmp3 to i64
  %2 = mul i64 4, %tmp4
  %tmp5 = load i32* %x, align 4
  %tmp6 = zext i32 %tmp5 to i64
  %3 = mul i64 %2, %tmp6
  %vla7 = alloca i8, i64 %3, align 16
  %tmp8 = bitcast i8* %vla7 to i32*
  store i32 2, i32* %n, align 4
  %div = udiv i64 %1, 4
  %conv = trunc i64 %div to i32
  %tmp11 = load i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %tmp11)
  %tmp12 = load i32* %n, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* %n, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %n, align 4
  %idxprom = sext i32 %tmp14 to i64
  %4 = mul i64 %idxprom, %2
  %5 = bitcast i32* %tmp8 to i8*
  %arrayidx = getelementptr inbounds i8* %5, i64 %4
  %6 = bitcast i8* %arrayidx to i32*
  %conv15 = trunc i64 %2 to i32
  store i32 %conv15, i32* %size, align 4
  %tmp16 = load i32* %n, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* %n, align 4
  %inc19 = add nsw i32 %tmp18, 1
  store i32 %inc19, i32* %n, align 4
  %idxprom20 = sext i32 %tmp18 to i64
  %7 = mul i64 %idxprom20, %2
  %8 = bitcast i32* %tmp8 to i8*
  %arrayidx21 = getelementptr inbounds i8* %8, i64 %7
  %9 = bitcast i8* %arrayidx21 to i32*
  %div22 = udiv i64 %3, %2
  %conv23 = trunc i64 %div22 to i32
  %tmp24 = load i32* %x, align 4
  %add = add nsw i32 %tmp24, 1
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %conv23, i32 %add)
  %tmp26 = load i32* %n, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* %n, align 4
  %inc29 = add nsw i32 %tmp28, 1
  store i32 %inc29, i32* %n, align 4
  %tmp30 = zext i32 %tmp28 to i64
  %10 = mul i64 4, %tmp30
  %conv31 = trunc i64 %10 to i32
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i32 0, i32 0), i32 %conv31)
  %tmp33 = load i32* %n, align 4
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %tmp33)
  %tmp35 = load i8** %saved_stack
  call void @llvm.stackrestore(i8* %tmp35)
  %11 = load i32* %retval
  ret i32 %11
}

declare i8* @llvm.stacksave() nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.stackrestore(i8*) nounwind
