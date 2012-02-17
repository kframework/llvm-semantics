; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testStatic.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global i32 17, align 4
@y = global i32 5, align 4
@f.x = internal unnamed_addr global i32 0, align 4
@f.x1 = internal unnamed_addr global i32 0, align 4
@g.x = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"01y=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"02y=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"03y=%d\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"04y=%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %tmp = load i32* @f.x, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @f.x, align 4
  %tmp1 = load i32* @f.x1, align 4
  %add = add nsw i32 %tmp1, 2
  store i32 %add, i32* @f.x1, align 4
  %mul = shl i32 %add, 1
  %mul5 = mul nsw i32 %inc, 3
  %add6 = add nsw i32 %mul, %mul5
  ret i32 %add6
}

define i32 @g() nounwind uwtable {
entry:
  %tmp = load i32* @g.x, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @g.x, align 4
  ret i32 %inc
}

define i32 @main() nounwind uwtable {
entry:
  %tmp = load i32* @y, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0), i32 6) nounwind
  %tmp4 = load i32* @y, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 %tmp4) nounwind
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i32 6) nounwind
  %tmp.i = load i32* @f.x, align 4
  %tmp1.i = load i32* @f.x1, align 4
  %tmp.i14 = load i32* @g.x, align 4
  %inc.i4 = add i32 %tmp.i, 3
  store i32 %inc.i4, i32* @f.x, align 4
  %add.i6 = add i32 %tmp1.i, 6
  store i32 %add.i6, i32* @f.x1, align 4
  %mul.i7 = shl i32 %add.i6, 1
  %mul5.i8 = mul nsw i32 %inc.i4, 3
  %inc.i2 = add i32 %tmp.i14, 4
  store i32 %inc.i2, i32* @g.x, align 4
  %add6.i9 = add i32 %mul.i7, %mul5.i8
  %add = add i32 %add6.i9, %inc.i2
  ret i32 %add
}

declare i32 @printf(i8* nocapture, ...) nounwind
