; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42231.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@max = internal unnamed_addr global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call fastcc i32 @CallFunctionRec(i32 1) nounwind
  %tobool.i = icmp eq i32 %call.i, 0
  br i1 %tobool.i, label %CallFunction.exit, label %land.rhs.i

land.rhs.i:                                       ; preds = %entry
  tail call fastcc void @storemax(i32 0) nounwind
  br label %CallFunction.exit

CallFunction.exit:                                ; preds = %entry, %land.rhs.i
  %0 = load i32* @max, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %CallFunction.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %CallFunction.exit
  ret i32 0
}

declare void @abort() noreturn nounwind

define internal fastcc void @storemax(i32 %i) nounwind uwtable noinline {
entry:
  %0 = load i32* @max, align 4, !tbaa !0
  %cmp = icmp slt i32 %0, %i
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 %i, i32* @max, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define internal fastcc i32 @CallFunctionRec(i32 %depth) nounwind uwtable {
entry:
  tail call fastcc void @storemax(i32 %depth) nounwind
  %cmp.i = icmp eq i32 %depth, 0
  br i1 %cmp.i, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp = icmp slt i32 %depth, 10
  br i1 %cmp, label %if.then1, label %return

if.then1:                                         ; preds = %if.end
  %add = add nsw i32 %depth, 1
  %0 = tail call fastcc i32 @CallFunctionRec(i32 %add)
  ret i32 1

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %if.end ]
  ret i32 %retval.0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
