; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-03-NotTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"Bitwise Not: %d %d %d %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Boolean Not: %d %d %d %d %d %d\0A\00", align 1

define void @testBitWiseNot(i32 %A, i32 %B, i32 %C, i32 %D) nounwind uwtable {
entry:
  %A.addr = alloca i32, align 4
  %B.addr = alloca i32, align 4
  %C.addr = alloca i32, align 4
  %D.addr = alloca i32, align 4
  store i32 %A, i32* %A.addr, align 4
  store i32 %B, i32* %B.addr, align 4
  store i32 %C, i32* %C.addr, align 4
  store i32 %D, i32* %D.addr, align 4
  %0 = load i32* %A.addr, align 4
  %neg = xor i32 %0, -1
  %1 = load i32* %B.addr, align 4
  %neg1 = xor i32 %1, -1
  %2 = load i32* %C.addr, align 4
  %neg2 = xor i32 %2, -1
  %3 = load i32* %D.addr, align 4
  %neg3 = xor i32 %3, -1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %neg, i32 %neg1, i32 %neg2, i32 %neg3)
  ret void
}

declare i32 @printf(i8*, ...)

define void @testBooleanNot(i32 %A, i32 %B, i32 %C, i32 %D) nounwind uwtable {
entry:
  %A.addr = alloca i32, align 4
  %B.addr = alloca i32, align 4
  %C.addr = alloca i32, align 4
  %D.addr = alloca i32, align 4
  store i32 %A, i32* %A.addr, align 4
  store i32 %B, i32* %B.addr, align 4
  store i32 %C, i32* %C.addr, align 4
  store i32 %D, i32* %D.addr, align 4
  %0 = load i32* %A.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i32* %B.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %lnot = xor i1 %2, true
  %lnot.ext = zext i1 %lnot to i32
  %3 = load i32* %A.addr, align 4
  %cmp2 = icmp sgt i32 %3, 0
  br i1 %cmp2, label %land.rhs3, label %land.end5

land.rhs3:                                        ; preds = %land.end
  %4 = load i32* %C.addr, align 4
  %cmp4 = icmp sgt i32 %4, 0
  br label %land.end5

land.end5:                                        ; preds = %land.rhs3, %land.end
  %5 = phi i1 [ false, %land.end ], [ %cmp4, %land.rhs3 ]
  %lnot6 = xor i1 %5, true
  %lnot.ext7 = zext i1 %lnot6 to i32
  %6 = load i32* %A.addr, align 4
  %cmp8 = icmp sgt i32 %6, 0
  br i1 %cmp8, label %land.rhs9, label %land.end11

land.rhs9:                                        ; preds = %land.end5
  %7 = load i32* %D.addr, align 4
  %cmp10 = icmp sgt i32 %7, 0
  br label %land.end11

land.end11:                                       ; preds = %land.rhs9, %land.end5
  %8 = phi i1 [ false, %land.end5 ], [ %cmp10, %land.rhs9 ]
  %lnot12 = xor i1 %8, true
  %lnot.ext13 = zext i1 %lnot12 to i32
  %9 = load i32* %B.addr, align 4
  %cmp14 = icmp sgt i32 %9, 0
  br i1 %cmp14, label %land.rhs15, label %land.end17

land.rhs15:                                       ; preds = %land.end11
  %10 = load i32* %C.addr, align 4
  %cmp16 = icmp sgt i32 %10, 0
  br label %land.end17

land.end17:                                       ; preds = %land.rhs15, %land.end11
  %11 = phi i1 [ false, %land.end11 ], [ %cmp16, %land.rhs15 ]
  %lnot18 = xor i1 %11, true
  %lnot.ext19 = zext i1 %lnot18 to i32
  %12 = load i32* %B.addr, align 4
  %cmp20 = icmp sgt i32 %12, 0
  br i1 %cmp20, label %land.rhs21, label %land.end23

land.rhs21:                                       ; preds = %land.end17
  %13 = load i32* %D.addr, align 4
  %cmp22 = icmp sgt i32 %13, 0
  br label %land.end23

land.end23:                                       ; preds = %land.rhs21, %land.end17
  %14 = phi i1 [ false, %land.end17 ], [ %cmp22, %land.rhs21 ]
  %lnot24 = xor i1 %14, true
  %lnot.ext25 = zext i1 %lnot24 to i32
  %15 = load i32* %C.addr, align 4
  %cmp26 = icmp sgt i32 %15, 0
  br i1 %cmp26, label %land.rhs27, label %land.end29

land.rhs27:                                       ; preds = %land.end23
  %16 = load i32* %D.addr, align 4
  %cmp28 = icmp sgt i32 %16, 0
  br label %land.end29

land.end29:                                       ; preds = %land.rhs27, %land.end23
  %17 = phi i1 [ false, %land.end23 ], [ %cmp28, %land.rhs27 ]
  %lnot30 = xor i1 %17, true
  %lnot.ext31 = zext i1 %lnot30 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %lnot.ext, i32 %lnot.ext7, i32 %lnot.ext13, i32 %lnot.ext19, i32 %lnot.ext25, i32 %lnot.ext31)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @testBitWiseNot(i32 1, i32 2, i32 -3, i32 5)
  call void @testBooleanNot(i32 1, i32 2, i32 -3, i32 5)
  ret i32 0
}
