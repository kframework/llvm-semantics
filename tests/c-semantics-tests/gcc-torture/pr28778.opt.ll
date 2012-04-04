; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28778.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @find(i32* %alistp) nounwind uwtable {
entry:
  %list = alloca [32 x i32], align 16
  %tobool = icmp eq i32* %alistp, null
  br i1 %tobool, label %if.else, label %if.end

if.else:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [32 x i32]* %list, i64 0, i64 3
  store i32 42, i32* %arrayidx, align 4, !tbaa !0
  %arraydecay = getelementptr inbounds [32 x i32]* %list, i64 0, i64 0
  br label %if.end

if.end:                                           ; preds = %entry, %if.else
  %blist.0 = phi i32* [ %arraydecay, %if.else ], [ %alistp, %entry ]
  %arrayidx.i = getelementptr inbounds i32* %blist.0, i64 3
  %0 = load i32* %arrayidx.i, align 4, !tbaa !0
  %cmp.i = icmp eq i32 %0, 42
  br i1 %cmp.i, label %aglChoosePixelFormat.exit, label %if.then.i

if.then.i:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

aglChoosePixelFormat.exit:                        ; preds = %if.end
  ret void
}

define void @aglChoosePixelFormat(i64* nocapture %a) nounwind uwtable {
entry:
  %0 = bitcast i64* %a to i32*
  %arrayidx = getelementptr inbounds i32* %0, i64 3
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp = icmp eq i32 %1, 42
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
find.exit:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
