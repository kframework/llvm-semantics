; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x0607060209.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 6, align 4
@m = global i32 7, align 4
@.str = private unnamed_addr constant [21 x i8] c"c[0][2][4][5] == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [21 x i8] c"c[1][3][4][5] == %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @n, align 4, !tbaa !0
  %1 = zext i32 %0 to i64
  %2 = load i32* @m, align 4, !tbaa !0
  %3 = zext i32 %2 to i64
  %4 = mul i64 %1, 6
  %5 = mul i64 %4, %1
  %6 = mul i64 %5, %3
  %vla1 = alloca i32, i64 %6, align 16
  %7 = mul nuw i64 %4, %3
  %8 = mul i64 %3, 12
  %9 = shl nuw nsw i64 %3, 2
  %arrayidx4.sum = add i64 %9, 5
  %arrayidx5.sum = add i64 %arrayidx4.sum, %8
  %arrayidx6 = getelementptr inbounds i32* %vla1, i64 %arrayidx5.sum
  store i32 32, i32* %arrayidx6, align 4, !tbaa !0
  %10 = add i64 %4, 18
  %arrayidx7.sum = mul i64 %10, %3
  %arrayidx9.sum = add i64 %arrayidx4.sum, %arrayidx7.sum
  %arrayidx10 = getelementptr inbounds i32* %vla1, i64 %arrayidx9.sum
  store i32 24, i32* %arrayidx10, align 4, !tbaa !0
  %11 = shl i64 %7, 1
  %12 = shl nuw nsw i64 %3, 1
  %arrayidx11.sum = add i64 %12, 5
  %arrayidx12.sum = add i64 %arrayidx11.sum, %8
  %arrayidx13.sum = add i64 %arrayidx12.sum, %11
  %arrayidx14 = getelementptr inbounds i32* %vla1, i64 %arrayidx13.sum
  store i32 17, i32* %arrayidx14, align 4, !tbaa !0
  %13 = mul nsw i64 %7, 3
  %arrayidx15.sum = add i64 %12, 4
  %arrayidx16.sum = add i64 %arrayidx15.sum, %8
  %arrayidx17.sum = add i64 %arrayidx16.sum, %13
  %arrayidx18 = getelementptr inbounds i32* %vla1, i64 %arrayidx17.sum
  store i32 99, i32* %arrayidx18, align 8, !tbaa !0
  %14 = load i32* %arrayidx6, align 4, !tbaa !0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %14) nounwind
  %15 = load i32* %arrayidx10, align 4, !tbaa !0
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i64 0, i64 0), i32 %15) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
