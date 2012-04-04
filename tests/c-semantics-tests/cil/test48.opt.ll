; ModuleID = '/home/david/src/c-semantics/tests/cil/test48.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fun = type { i32, i32 }

@a = common global [10 x [20 x %struct.fun]] zeroinitializer, align 16
@b = global [20 x %struct.fun]* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 0), align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %0 = load [20 x %struct.fun]** @b, align 8, !tbaa !0
  %x = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 0, i32 0
  store i32 0, i32* %x, align 4, !tbaa !3
  %x.1 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 1, i32 0
  store i32 2, i32* %x.1, align 4, !tbaa !3
  %x.2 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 2, i32 0
  store i32 4, i32* %x.2, align 4, !tbaa !3
  %x.3 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 3, i32 0
  store i32 6, i32* %x.3, align 4, !tbaa !3
  %x.4 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 4, i32 0
  store i32 8, i32* %x.4, align 4, !tbaa !3
  %x.5 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 5, i32 0
  store i32 10, i32* %x.5, align 4, !tbaa !3
  %x.6 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 6, i32 0
  store i32 12, i32* %x.6, align 4, !tbaa !3
  %x.7 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 7, i32 0
  store i32 14, i32* %x.7, align 4, !tbaa !3
  %x.8 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 8, i32 0
  store i32 16, i32* %x.8, align 4, !tbaa !3
  %x.9 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 9, i32 0
  store i32 18, i32* %x.9, align 4, !tbaa !3
  %x.10 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 10, i32 0
  store i32 20, i32* %x.10, align 4, !tbaa !3
  %x.11 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 11, i32 0
  store i32 22, i32* %x.11, align 4, !tbaa !3
  %x.12 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 12, i32 0
  store i32 24, i32* %x.12, align 4, !tbaa !3
  %x.13 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 13, i32 0
  store i32 26, i32* %x.13, align 4, !tbaa !3
  %x.14 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 14, i32 0
  store i32 28, i32* %x.14, align 4, !tbaa !3
  %x.15 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 15, i32 0
  store i32 30, i32* %x.15, align 4, !tbaa !3
  %x.16 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 16, i32 0
  store i32 32, i32* %x.16, align 4, !tbaa !3
  %x.17 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 17, i32 0
  store i32 34, i32* %x.17, align 4, !tbaa !3
  %x.18 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 18, i32 0
  store i32 36, i32* %x.18, align 4, !tbaa !3
  %x.19 = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 19, i32 0
  store i32 38, i32* %x.19, align 4, !tbaa !3
  %1 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 5, i32 0), align 8, !tbaa !3
  %2 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 6, i32 0), align 16, !tbaa !3
  %add.1 = add nsw i32 %2, %1
  %3 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 7, i32 0), align 8, !tbaa !3
  %add.2 = add nsw i32 %3, %add.1
  %4 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 8, i32 0), align 16, !tbaa !3
  %add.3 = add nsw i32 %4, %add.2
  %5 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 9, i32 0), align 8, !tbaa !3
  %add.4 = add nsw i32 %5, %add.3
  %6 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 10, i32 0), align 16, !tbaa !3
  %add.5 = add nsw i32 %6, %add.4
  %7 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 11, i32 0), align 8, !tbaa !3
  %add.6 = add nsw i32 %7, %add.5
  %8 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 12, i32 0), align 16, !tbaa !3
  %add.7 = add nsw i32 %8, %add.6
  %9 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 13, i32 0), align 8, !tbaa !3
  %add.8 = add nsw i32 %9, %add.7
  %10 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 14, i32 0), align 16, !tbaa !3
  %add.9 = add nsw i32 %10, %add.8
  %cmp22 = icmp eq i32 %add.9, 190
  %conv = zext i1 %cmp22 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load [20 x %struct.fun]** @b, align 8, !tbaa !0
  %x.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 0, i32 0
  store i32 0, i32* %x.i, align 4, !tbaa !3
  %x.1.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 1, i32 0
  store i32 2, i32* %x.1.i, align 4, !tbaa !3
  %x.2.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 2, i32 0
  store i32 4, i32* %x.2.i, align 4, !tbaa !3
  %x.3.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 3, i32 0
  store i32 6, i32* %x.3.i, align 4, !tbaa !3
  %x.4.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 4, i32 0
  store i32 8, i32* %x.4.i, align 4, !tbaa !3
  %x.5.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 5, i32 0
  store i32 10, i32* %x.5.i, align 4, !tbaa !3
  %x.6.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 6, i32 0
  store i32 12, i32* %x.6.i, align 4, !tbaa !3
  %x.7.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 7, i32 0
  store i32 14, i32* %x.7.i, align 4, !tbaa !3
  %x.8.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 8, i32 0
  store i32 16, i32* %x.8.i, align 4, !tbaa !3
  %x.9.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 9, i32 0
  store i32 18, i32* %x.9.i, align 4, !tbaa !3
  %x.10.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 10, i32 0
  store i32 20, i32* %x.10.i, align 4, !tbaa !3
  %x.11.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 11, i32 0
  store i32 22, i32* %x.11.i, align 4, !tbaa !3
  %x.12.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 12, i32 0
  store i32 24, i32* %x.12.i, align 4, !tbaa !3
  %x.13.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 13, i32 0
  store i32 26, i32* %x.13.i, align 4, !tbaa !3
  %x.14.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 14, i32 0
  store i32 28, i32* %x.14.i, align 4, !tbaa !3
  %x.15.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 15, i32 0
  store i32 30, i32* %x.15.i, align 4, !tbaa !3
  %x.16.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 16, i32 0
  store i32 32, i32* %x.16.i, align 4, !tbaa !3
  %x.17.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 17, i32 0
  store i32 34, i32* %x.17.i, align 4, !tbaa !3
  %x.18.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 18, i32 0
  store i32 36, i32* %x.18.i, align 4, !tbaa !3
  %x.19.i = getelementptr inbounds [20 x %struct.fun]* %0, i64 1, i64 19, i32 0
  store i32 38, i32* %x.19.i, align 4, !tbaa !3
  %1 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 5, i32 0), align 8, !tbaa !3
  %2 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 6, i32 0), align 16, !tbaa !3
  %3 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 7, i32 0), align 8, !tbaa !3
  %4 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 8, i32 0), align 16, !tbaa !3
  %5 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 9, i32 0), align 8, !tbaa !3
  %6 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 10, i32 0), align 16, !tbaa !3
  %7 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 11, i32 0), align 8, !tbaa !3
  %8 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 12, i32 0), align 16, !tbaa !3
  %9 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 13, i32 0), align 8, !tbaa !3
  %10 = load i32* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i64 0, i64 1, i64 14, i32 0), align 16, !tbaa !3
  %add.1.i = add i32 %2, %1
  %add.2.i = add i32 %add.1.i, %3
  %add.3.i = add i32 %add.2.i, %4
  %add.4.i = add i32 %add.3.i, %5
  %add.5.i = add i32 %add.4.i, %6
  %add.6.i = add i32 %add.5.i, %7
  %add.7.i = add i32 %add.6.i, %8
  %add.8.i = add i32 %add.7.i, %9
  %add.9.i = add i32 %add.8.i, %10
  %cmp22.i = icmp eq i32 %add.9.i, 190
  %conv.i = zext i1 %cmp22.i to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
