; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/const-addr-expr-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i8* }

@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@Upgrade_items = global [3 x %struct.foo] [%struct.foo { i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0) }, %struct.foo { i32 2, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0) }, %struct.foo zeroinitializer], align 16
@Upgd_minor_ID = global i32* getelementptr inbounds ([3 x %struct.foo]* @Upgrade_items, i64 0, i64 1, i32 0), align 8
@Upgd_minor_ID1 = global i32* getelementptr inbounds ([3 x %struct.foo]* @Upgrade_items, i64 0, i64 0, i32 0), align 8

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load i32** @Upgd_minor_ID, align 8, !tbaa !0
  %1 = load i32* %0, align 4, !tbaa !3
  %cmp = icmp eq i32 %1, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32** @Upgd_minor_ID1, align 8, !tbaa !0
  %3 = load i32* %2, align 4, !tbaa !3
  %cmp1 = icmp eq i32 %3, 1
  br i1 %cmp1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
