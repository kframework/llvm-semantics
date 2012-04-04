; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStructInitializer.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8* }
%struct.anon.0 = type { i8, [2 x i8] }
%struct.sa3b = type { %struct.sa3, [3 x i8] }
%struct.sa3 = type { i8, [0 x i8] }
%struct.anon.1 = type { i8, [2 x i8] }
%struct.anon.2 = type { i8, %struct.inner_Struct }
%struct.inner_Struct = type { i8, [2 x i8] }

@basicInit = global i32 5, align 4
@basicInit2 = global i8 10, align 1
@basicArr = global [2 x i32] [i32 15, i32 20], align 4
@.str = private unnamed_addr constant [3 x i8] c"62\00", align 1
@a1 = global %struct.anon { i8 52, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0) }, align 8
@a2 = global %struct.anon.0 { i8 118, [2 x i8] c"cq" }, align 1
@a3 = global %struct.sa3b { %struct.sa3 { i8 111, [0 x i8] zeroinitializer }, [3 x i8] c"wx\00" }, align 1
@a4 = global %struct.anon.1 { i8 57, [2 x i8] c"eb" }, align 1
@a5 = global %struct.anon.2 { i8 57, %struct.inner_Struct { i8 55, [2 x i8] c"zd" } }, align 1
@.str1 = private unnamed_addr constant [5 x i8] c"FAIL\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @basicInit, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 5
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %1 = load i8* @basicInit2, align 1, !tbaa !1
  %cmp1 = icmp eq i8 %1, 10
  br i1 %cmp1, label %if.end5, label %if.then3

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then3
  %2 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i64 0, i64 0), align 4, !tbaa !0
  %cmp6 = icmp eq i32 %2, 15
  br i1 %cmp6, label %if.end10, label %if.then8

if.then8:                                         ; preds = %if.end5
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end10

if.end10:                                         ; preds = %if.end5, %if.then8
  %3 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i64 0, i64 1), align 4, !tbaa !0
  %cmp11 = icmp eq i32 %3, 20
  br i1 %cmp11, label %if.end15, label %if.then13

if.then13:                                        ; preds = %if.end10
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end15

if.end15:                                         ; preds = %if.end10, %if.then13
  %4 = load i8* getelementptr inbounds (%struct.anon* @a1, i64 0, i32 0), align 8, !tbaa !1
  %cmp17 = icmp eq i8 %4, 52
  br i1 %cmp17, label %if.end21, label %if.then19

if.then19:                                        ; preds = %if.end15
  %call20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end21

if.end21:                                         ; preds = %if.end15, %if.then19
  %5 = load i8** getelementptr inbounds (%struct.anon* @a1, i64 0, i32 1), align 8, !tbaa !3
  %6 = load i8* %5, align 1, !tbaa !1
  %cmp23 = icmp eq i8 %6, 54
  br i1 %cmp23, label %if.end27, label %if.then25

if.then25:                                        ; preds = %if.end21
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  %.pre = load i8** getelementptr inbounds (%struct.anon* @a1, i64 0, i32 1), align 8, !tbaa !3
  br label %if.end27

if.end27:                                         ; preds = %if.end21, %if.then25
  %7 = phi i8* [ %5, %if.end21 ], [ %.pre, %if.then25 ]
  %arrayidx28 = getelementptr inbounds i8* %7, i64 1
  %8 = load i8* %arrayidx28, align 1, !tbaa !1
  %cmp30 = icmp eq i8 %8, 50
  br i1 %cmp30, label %if.end34, label %if.then32

if.then32:                                        ; preds = %if.end27
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  %.pre96 = load i8** getelementptr inbounds (%struct.anon* @a1, i64 0, i32 1), align 8, !tbaa !3
  br label %if.end34

if.end34:                                         ; preds = %if.end27, %if.then32
  %9 = phi i8* [ %7, %if.end27 ], [ %.pre96, %if.then32 ]
  %arrayidx35 = getelementptr inbounds i8* %9, i64 2
  %10 = load i8* %arrayidx35, align 1, !tbaa !1
  %cmp37 = icmp eq i8 %10, 0
  br i1 %cmp37, label %if.end41, label %if.then39

if.then39:                                        ; preds = %if.end34
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end41

if.end41:                                         ; preds = %if.end34, %if.then39
  %11 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i64 0, i32 0), align 1, !tbaa !1
  %cmp43 = icmp eq i8 %11, 118
  br i1 %cmp43, label %if.end47, label %if.then45

if.then45:                                        ; preds = %if.end41
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end47

if.end47:                                         ; preds = %if.end41, %if.then45
  %12 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i64 0, i32 1, i64 0), align 1, !tbaa !1
  %cmp49 = icmp eq i8 %12, 99
  br i1 %cmp49, label %if.end53, label %if.then51

if.then51:                                        ; preds = %if.end47
  %call52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end53

if.end53:                                         ; preds = %if.end47, %if.then51
  %13 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i64 0, i32 1, i64 1), align 1, !tbaa !1
  %cmp55 = icmp eq i8 %13, 113
  br i1 %cmp55, label %if.end59, label %if.then57

if.then57:                                        ; preds = %if.end53
  %call58 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end59

if.end59:                                         ; preds = %if.end53, %if.then57
  %14 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i64 0, i32 0, i32 0), align 1, !tbaa !1
  %cmp61 = icmp eq i8 %14, 111
  br i1 %cmp61, label %if.end65, label %if.then63

if.then63:                                        ; preds = %if.end59
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end65

if.end65:                                         ; preds = %if.end59, %if.then63
  %15 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i64 0, i32 1, i64 0), align 1, !tbaa !1
  %cmp67 = icmp eq i8 %15, 119
  br i1 %cmp67, label %if.end71, label %if.then69

if.then69:                                        ; preds = %if.end65
  %call70 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end71

if.end71:                                         ; preds = %if.end65, %if.then69
  %16 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i64 0, i32 1, i64 1), align 1, !tbaa !1
  %cmp73 = icmp eq i8 %16, 120
  br i1 %cmp73, label %if.end77, label %if.then75

if.then75:                                        ; preds = %if.end71
  %call76 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end77

if.end77:                                         ; preds = %if.end71, %if.then75
  %17 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i64 0, i32 0), align 1, !tbaa !1
  %cmp79 = icmp eq i8 %17, 57
  br i1 %cmp79, label %if.end83, label %if.then81

if.then81:                                        ; preds = %if.end77
  %call82 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end83

if.end83:                                         ; preds = %if.end77, %if.then81
  %18 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i64 0, i32 1, i64 0), align 1, !tbaa !1
  %cmp85 = icmp eq i8 %18, 101
  br i1 %cmp85, label %if.end89, label %if.then87

if.then87:                                        ; preds = %if.end83
  %call88 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end89

if.end89:                                         ; preds = %if.end83, %if.then87
  %19 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i64 0, i32 1, i64 1), align 1, !tbaa !1
  %cmp91 = icmp eq i8 %19, 98
  br i1 %cmp91, label %if.end95, label %if.then93

if.then93:                                        ; preds = %if.end89
  %call94 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end95

if.end95:                                         ; preds = %if.end89, %if.then93
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
