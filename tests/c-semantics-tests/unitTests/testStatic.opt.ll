; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32* @f.x, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f.x, align 4, !tbaa !0
  %1 = load i32* @f.x1, align 4, !tbaa !0
  %add = add nsw i32 %1, 2
  store i32 %add, i32* @f.x1, align 4, !tbaa !0
  %mul = shl i32 %add, 1
  %mul1 = mul nsw i32 %inc, 3
  %add2 = add nsw i32 %mul, %mul1
  ret i32 %add2
}

define i32 @g() nounwind uwtable {
entry:
  %0 = load i32* @g.x, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @g.x, align 4, !tbaa !0
  ret i32 %inc
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @y, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0), i32 6) nounwind
  %1 = load i32* @y, align 4, !tbaa !0
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0), i32 %1) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i32 6) nounwind
  %2 = load i32* @f.x, align 4, !tbaa !0
  %3 = load i32* @f.x1, align 4, !tbaa !0
  %4 = load i32* @g.x, align 4, !tbaa !0
  %inc.i12 = add nsw i32 %2, 3
  store i32 %inc.i12, i32* @f.x, align 4, !tbaa !0
  %add.i13 = add nsw i32 %3, 6
  store i32 %add.i13, i32* @f.x1, align 4, !tbaa !0
  %mul.i14 = shl i32 %add.i13, 1
  %mul1.i15 = mul nsw i32 %inc.i12, 3
  %inc.i11 = add nsw i32 %4, 4
  store i32 %inc.i11, i32* @g.x, align 4, !tbaa !0
  %add2.i16 = add i32 %mul.i14, %mul1.i15
  %add = add i32 %add2.i16, %inc.i11
  ret i32 %add
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
