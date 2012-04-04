; ModuleID = '/home/david/src/c-semantics/tests/cil/test47.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [10 x [20 x i32]] zeroinitializer, align 16
@b = global [20 x i32]* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 0), align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %0 = load [20 x i32]** @b, align 8, !tbaa !0
  %arrayidx1 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 0
  store i32 0, i32* %arrayidx1, align 4, !tbaa !3
  %arrayidx1.1 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 1
  store i32 2, i32* %arrayidx1.1, align 4, !tbaa !3
  %arrayidx1.2 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 2
  store i32 4, i32* %arrayidx1.2, align 4, !tbaa !3
  %arrayidx1.3 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 3
  store i32 6, i32* %arrayidx1.3, align 4, !tbaa !3
  %arrayidx1.4 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 4
  store i32 8, i32* %arrayidx1.4, align 4, !tbaa !3
  %arrayidx1.5 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 5
  store i32 10, i32* %arrayidx1.5, align 4, !tbaa !3
  %arrayidx1.6 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 6
  store i32 12, i32* %arrayidx1.6, align 4, !tbaa !3
  %arrayidx1.7 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 7
  store i32 14, i32* %arrayidx1.7, align 4, !tbaa !3
  %arrayidx1.8 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 8
  store i32 16, i32* %arrayidx1.8, align 4, !tbaa !3
  %arrayidx1.9 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 9
  store i32 18, i32* %arrayidx1.9, align 4, !tbaa !3
  %arrayidx1.10 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 10
  store i32 20, i32* %arrayidx1.10, align 4, !tbaa !3
  %arrayidx1.11 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 11
  store i32 22, i32* %arrayidx1.11, align 4, !tbaa !3
  %arrayidx1.12 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 12
  store i32 24, i32* %arrayidx1.12, align 4, !tbaa !3
  %arrayidx1.13 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 13
  store i32 26, i32* %arrayidx1.13, align 4, !tbaa !3
  %arrayidx1.14 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 14
  store i32 28, i32* %arrayidx1.14, align 4, !tbaa !3
  %arrayidx1.15 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 15
  store i32 30, i32* %arrayidx1.15, align 4, !tbaa !3
  %arrayidx1.16 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 16
  store i32 32, i32* %arrayidx1.16, align 4, !tbaa !3
  %arrayidx1.17 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 17
  store i32 34, i32* %arrayidx1.17, align 4, !tbaa !3
  %arrayidx1.18 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 18
  store i32 36, i32* %arrayidx1.18, align 4, !tbaa !3
  %arrayidx1.19 = getelementptr inbounds [20 x i32]* %0, i64 1, i64 19
  store i32 38, i32* %arrayidx1.19, align 4, !tbaa !3
  %1 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 5), align 4, !tbaa !3
  %2 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 6), align 8, !tbaa !3
  %add.1 = add nsw i32 %2, %1
  %3 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 7), align 4, !tbaa !3
  %add.2 = add nsw i32 %3, %add.1
  %4 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 8), align 16, !tbaa !3
  %add.3 = add nsw i32 %4, %add.2
  %5 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 9), align 4, !tbaa !3
  %add.4 = add nsw i32 %5, %add.3
  %6 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 10), align 8, !tbaa !3
  %add.5 = add nsw i32 %6, %add.4
  %7 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 11), align 4, !tbaa !3
  %add.6 = add nsw i32 %7, %add.5
  %8 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 12), align 16, !tbaa !3
  %add.7 = add nsw i32 %8, %add.6
  %9 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 13), align 4, !tbaa !3
  %add.8 = add nsw i32 %9, %add.7
  %10 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 14), align 8, !tbaa !3
  %add.9 = add nsw i32 %10, %add.8
  %cmp20 = icmp eq i32 %add.9, 190
  %conv = zext i1 %cmp20 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load [20 x i32]** @b, align 8, !tbaa !0
  %arrayidx1.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 0
  store i32 0, i32* %arrayidx1.i, align 4, !tbaa !3
  %arrayidx1.1.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 1
  store i32 2, i32* %arrayidx1.1.i, align 4, !tbaa !3
  %arrayidx1.2.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 2
  store i32 4, i32* %arrayidx1.2.i, align 4, !tbaa !3
  %arrayidx1.3.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 3
  store i32 6, i32* %arrayidx1.3.i, align 4, !tbaa !3
  %arrayidx1.4.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 4
  store i32 8, i32* %arrayidx1.4.i, align 4, !tbaa !3
  %arrayidx1.5.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 5
  store i32 10, i32* %arrayidx1.5.i, align 4, !tbaa !3
  %arrayidx1.6.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 6
  store i32 12, i32* %arrayidx1.6.i, align 4, !tbaa !3
  %arrayidx1.7.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 7
  store i32 14, i32* %arrayidx1.7.i, align 4, !tbaa !3
  %arrayidx1.8.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 8
  store i32 16, i32* %arrayidx1.8.i, align 4, !tbaa !3
  %arrayidx1.9.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 9
  store i32 18, i32* %arrayidx1.9.i, align 4, !tbaa !3
  %arrayidx1.10.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 10
  store i32 20, i32* %arrayidx1.10.i, align 4, !tbaa !3
  %arrayidx1.11.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 11
  store i32 22, i32* %arrayidx1.11.i, align 4, !tbaa !3
  %arrayidx1.12.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 12
  store i32 24, i32* %arrayidx1.12.i, align 4, !tbaa !3
  %arrayidx1.13.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 13
  store i32 26, i32* %arrayidx1.13.i, align 4, !tbaa !3
  %arrayidx1.14.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 14
  store i32 28, i32* %arrayidx1.14.i, align 4, !tbaa !3
  %arrayidx1.15.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 15
  store i32 30, i32* %arrayidx1.15.i, align 4, !tbaa !3
  %arrayidx1.16.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 16
  store i32 32, i32* %arrayidx1.16.i, align 4, !tbaa !3
  %arrayidx1.17.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 17
  store i32 34, i32* %arrayidx1.17.i, align 4, !tbaa !3
  %arrayidx1.18.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 18
  store i32 36, i32* %arrayidx1.18.i, align 4, !tbaa !3
  %arrayidx1.19.i = getelementptr inbounds [20 x i32]* %0, i64 1, i64 19
  store i32 38, i32* %arrayidx1.19.i, align 4, !tbaa !3
  %1 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 5), align 4, !tbaa !3
  %2 = load i64* bitcast (i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 6) to i64*), align 8
  %3 = trunc i64 %2 to i32
  %4 = lshr i64 %2, 32
  %5 = trunc i64 %4 to i32
  %6 = load i64* bitcast (i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 8) to i64*), align 16
  %7 = trunc i64 %6 to i32
  %8 = lshr i64 %6, 32
  %9 = trunc i64 %8 to i32
  %10 = load i64* bitcast (i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 10) to i64*), align 8
  %11 = trunc i64 %10 to i32
  %12 = lshr i64 %10, 32
  %13 = trunc i64 %12 to i32
  %14 = load i64* bitcast (i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 12) to i64*), align 16
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = load i32* getelementptr inbounds ([10 x [20 x i32]]* @a, i64 0, i64 1, i64 14), align 8, !tbaa !3
  %add.1.i = add i32 %3, %1
  %add.2.i = add i32 %add.1.i, %5
  %add.3.i = add i32 %add.2.i, %7
  %add.4.i = add i32 %add.3.i, %9
  %add.5.i = add i32 %add.4.i, %11
  %add.6.i = add i32 %add.5.i, %13
  %add.7.i = add i32 %add.6.i, %15
  %add.8.i = add i32 %add.7.i, %17
  %add.9.i = add i32 %add.8.i, %18
  %cmp20.i = icmp eq i32 %add.9.i, 190
  %conv.i = zext i1 %cmp20.i to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
