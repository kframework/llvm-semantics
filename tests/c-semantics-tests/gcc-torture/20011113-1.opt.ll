; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { [2 x i8], i8, i8, [4 x i64] }
%struct.U = type { [3 x i64] }

@t = global { i8, i8, i8, i8, [4 x i64] } { i8 26, i8 0, i8 0, i8 0, [4 x i64] [i64 0, i64 21, i64 22, i64 23] }, align 8

define noalias %struct.t* @foo(%struct.t* nocapture %x) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 1
  %tmp = load i64* %arrayidx, align 8
  %arrayidx3.1 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 2
  %tmp4 = load i64* %arrayidx3.1, align 8
  %arrayidx3.2 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 3
  %tmp5 = load i64* %arrayidx3.2, align 8
  %cmp.i = icmp eq i64 %tmp, 21
  %cmp3.i = icmp eq i64 %tmp4, 22
  %or.cond = and i1 %cmp.i, %cmp3.i
  %cmp7.i = icmp eq i64 %tmp5, 23
  %or.cond19 = and i1 %or.cond, %cmp7.i
  br i1 %or.cond19, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret %struct.t* null
}

define noalias %struct.t* @bar(%struct.U* nocapture byval align 8 %d, i32 %m) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.U* %d, i64 0, i32 0, i64 0
  %0 = load i64* %arrayidx, align 8, !tbaa !0
  %cmp = icmp eq i64 %0, 21
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx2 = getelementptr inbounds %struct.U* %d, i64 0, i32 0, i64 1
  %1 = load i64* %arrayidx2, align 8, !tbaa !0
  %cmp3 = icmp eq i64 %1, 22
  br i1 %cmp3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arrayidx6 = getelementptr inbounds %struct.U* %d, i64 0, i32 0, i64 2
  %2 = load i64* %arrayidx6, align 8, !tbaa !0
  %cmp7 = icmp eq i64 %2, 23
  br i1 %cmp7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  ret %struct.t* null
}

define noalias %struct.t* @baz(%struct.t* nocapture %x) nounwind uwtable {
entry:
  %arrayidx6 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 1
  %tmp = load i64* %arrayidx6, align 8
  %arrayidx68.1 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 2
  %tmp9 = load i64* %arrayidx68.1, align 8
  %arrayidx68.2 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 3
  %tmp10 = load i64* %arrayidx68.2, align 8
  %cmp.i = icmp eq i64 %tmp, 21
  %cmp3.i = icmp eq i64 %tmp9, 22
  %or.cond = and i1 %cmp.i, %cmp3.i
  %cmp7.i = icmp eq i64 %tmp10, 23
  %or.cond25 = and i1 %or.cond, %cmp7.i
  br i1 %or.cond25, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret %struct.t* null
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp.i = load i64* getelementptr inbounds ({ i8, i8, i8, i8, [4 x i64] }* @t, i64 0, i32 4, i64 1), align 8
  %tmp9.i = load i64* getelementptr inbounds ({ i8, i8, i8, i8, [4 x i64] }* @t, i64 0, i32 4, i64 2), align 8
  %tmp10.i = load i64* getelementptr inbounds ({ i8, i8, i8, i8, [4 x i64] }* @t, i64 0, i32 4, i64 3), align 8
  %cmp.i.i = icmp eq i64 %tmp.i, 21
  %cmp3.i.i = icmp eq i64 %tmp9.i, 22
  %or.cond.i = and i1 %cmp.i.i, %cmp3.i.i
  %cmp7.i.i = icmp eq i64 %tmp10.i, 23
  %or.cond25.i = and i1 %or.cond.i, %cmp7.i.i
  br i1 %or.cond25.i, label %foo.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
