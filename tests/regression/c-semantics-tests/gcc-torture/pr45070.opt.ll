; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr45070.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.source = type { i32, i32, i32 }

define i32 @main() nounwind uwtable {
entry:
  %s = alloca %struct.source, align 4
  %pos = getelementptr inbounds %struct.source* %s, i64 0, i32 0
  store i32 0, i32* %pos, align 4, !tbaa !0
  %length = getelementptr inbounds %struct.source* %s, i64 0, i32 1
  store i32 0, i32* %length, align 4, !tbaa !0
  %flag = getelementptr inbounds %struct.source* %s, i64 0, i32 2
  store i32 0, i32* %flag, align 4, !tbaa !0
  br label %for.cond

for.cond:                                         ; preds = %lor.lhs.false, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %lor.lhs.false ]
  %cmp = icmp slt i32 %i.0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call fastcc i16 @next(%struct.source* %s)
  %cmp1 = icmp ne i32 %i.0, 0
  %cmp2 = icmp eq i16 %call, -1
  %or.cond = or i1 %cmp1, %cmp2
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %for.body
  %cmp4 = icmp slt i32 %i.0, 1
  %cmp9 = icmp eq i16 %call, 0
  %or.cond12 = or i1 %cmp4, %cmp9
  %inc = add nsw i32 %i.0, 1
  br i1 %or.cond12, label %for.cond, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %for.body
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal fastcc i16 @next(%struct.source* nocapture %p) nounwind uwtable noinline {
entry:
  %pos = getelementptr inbounds %struct.source* %p, i64 0, i32 0
  %length = getelementptr inbounds %struct.source* %p, i64 0, i32 1
  %flag = getelementptr inbounds %struct.source* %p, i64 0, i32 2
  br label %tailrecurse

tailrecurse:                                      ; preds = %if.then1, %entry
  %0 = load i32* %pos, align 4, !tbaa !0
  %1 = load i32* %length, align 4, !tbaa !0
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %return, label %if.then

if.then:                                          ; preds = %tailrecurse
  %2 = load i32* %flag, align 4, !tbaa !0
  %tobool = icmp eq i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then1

if.then1:                                         ; preds = %if.then
  store i32 0, i32* %flag, align 4, !tbaa !0
  tail call fastcc void @fetch(%struct.source* %p)
  br label %tailrecurse

if.end:                                           ; preds = %if.then
  store i32 1, i32* %flag, align 4, !tbaa !0
  br label %return

return:                                           ; preds = %tailrecurse, %if.end
  %retval.09.0 = phi i16 [ -1, %if.end ], [ 0, %tailrecurse ]
  ret i16 %retval.09.0
}

declare void @abort() noreturn nounwind

define internal fastcc void @fetch(%struct.source* nocapture %p) nounwind uwtable noinline {
entry:
  %length = getelementptr inbounds %struct.source* %p, i64 0, i32 1
  store i32 128, i32* %length, align 4, !tbaa !0
  ret void
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
