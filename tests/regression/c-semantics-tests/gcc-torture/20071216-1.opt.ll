; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = internal unnamed_addr global i32 0, align 4

define i32 @bar() nounwind uwtable readonly noinline {
entry:
  %0 = load i32* @x, align 4, !tbaa !0
  ret i32 %0
}

define i32 @foo() nounwind uwtable readonly {
entry:
  %call = tail call i32 @bar()
  %cmp = icmp ult i32 %call, -4095
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp3 = icmp eq i32 %call, -38
  %add8 = select i1 %cmp3, i32 -37, i32 -1
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ %add8, %if.end ], [ %call, %entry ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  store i32 26, i32* @x, align 4, !tbaa !0
  %call.i = tail call i32 @bar() nounwind
  %cmp = icmp eq i32 %call.i, 26
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i32 -39, i32* @x, align 4, !tbaa !0
  %call.i9 = tail call i32 @bar() nounwind
  %cmp.i10 = icmp ult i32 %call.i9, -4095
  %not.cmp3.i11 = icmp eq i32 %call.i9, -38
  %or.cond26 = or i1 %cmp.i10, %not.cmp3.i11
  br i1 %or.cond26, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  store i32 -38, i32* @x, align 4, !tbaa !0
  %call.i16 = tail call i32 @bar() nounwind
  %cmp3.i18 = icmp eq i32 %call.i16, -38
  br i1 %cmp3.i18, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
