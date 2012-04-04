; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@aim_callhandler.i = internal unnamed_addr global i32 0, align 4

define i32 @aim_callhandler(i32 %sess, i32 %conn, i16 zeroext %family, i16 zeroext %type) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %conn, 0
  %cmp = icmp eq i16 %type, -1
  %or.cond = or i1 %tobool, %cmp
  br i1 %or.cond, label %return, label %if.end3

if.end3:                                          ; preds = %entry
  %0 = load i32* @aim_callhandler.i, align 4, !tbaa !0
  %cmp4 = icmp sgt i32 %0, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end3
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @aim_callhandler.i, align 4, !tbaa !0
  br label %return

return:                                           ; preds = %entry, %if.end7
  ret i32 0
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @aim_callhandler.i, align 4, !tbaa !0
  %cmp4.i = icmp sgt i32 %0, 0
  br i1 %cmp4.i, label %if.then6.i, label %aim_callhandler.exit

if.then6.i:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

aim_callhandler.exit:                             ; preds = %entry
  %inc.i = add nsw i32 %0, 1
  store i32 %inc.i, i32* @aim_callhandler.i, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
