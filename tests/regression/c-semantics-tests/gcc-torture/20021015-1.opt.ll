; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021015-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_list = global [1 x i8] c"1", align 1

define void @g(i8* nocapture %p, i8* nocapture %list, i32 %length, i8** nocapture %elementPtr, i8** nocapture %nextPtr) nounwind uwtable {
entry:
  %0 = load i8** %nextPtr, align 8, !tbaa !0
  %cmp = icmp eq i8* %0, getelementptr inbounds ([1 x i8]* @g_list, i64 0, i64 0)
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i8 0, i8* getelementptr inbounds ([1 x i8]* @g_list, i64 0, i64 0), align 1, !tbaa !1
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %.pr = load i8* getelementptr inbounds ([1 x i8]* @g_list, i64 0, i64 0), align 1, !tbaa !1
  %phitmp = icmp eq i8 %.pr, 0
  br i1 %phitmp, label %for.end, label %g.exit

g.exit:                                           ; preds = %entry
  store i8 0, i8* getelementptr inbounds ([1 x i8]* @g_list, i64 0, i64 0), align 1, !tbaa !1
  br label %for.end

for.end:                                          ; preds = %g.exit, %entry
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
