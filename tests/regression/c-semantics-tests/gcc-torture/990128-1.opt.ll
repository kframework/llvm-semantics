; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990128-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { %struct.s* }

@count = global i32 0, align 4
@ss = common global %struct.s zeroinitializer, align 8
@p = common global %struct.s* null, align 8
@sss = common global [10 x %struct.s] zeroinitializer, align 16

define i32 @main() noreturn nounwind uwtable {
for.inc.i.i.preheader.lr.ph:
  store %struct.s* @ss, %struct.s** @p, align 8, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 0), %struct.s** getelementptr inbounds (%struct.s* @ss, i64 0, i32 0), align 8, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 1), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 0, i32 0), align 16, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 2), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 1, i32 0), align 8, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 3), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 2, i32 0), align 16, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 4), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 3, i32 0), align 8, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 5), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 4, i32 0), align 16, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 6), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 5, i32 0), align 8, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 7), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 6, i32 0), align 16, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 8), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 7, i32 0), align 8, !tbaa !0
  store %struct.s* getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 9), %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 8, i32 0), align 16, !tbaa !0
  store %struct.s* null, %struct.s** getelementptr inbounds ([10 x %struct.s]* @sss, i64 0, i64 9, i32 0), align 8, !tbaa !0
  %count.promoted = load i32* @count, align 4
  br label %for.inc.i.i.preheader

for.inc.i.i.preheader:                            ; preds = %for.inc.i.i.preheader.lr.ph, %if.then.i
  %inc.i.i7 = phi i32 [ %count.promoted, %for.inc.i.i.preheader.lr.ph ], [ %inc.i.i, %if.then.i ]
  %p.addr.0.i6 = phi %struct.s* [ @ss, %for.inc.i.i.preheader.lr.ph ], [ %p.addr.0.i, %if.then.i ]
  br label %for.inc.i.i

for.inc.i.i:                                      ; preds = %for.inc.i.i, %for.inc.i.i.preheader
  %p.addr.02.i.i = phi %struct.s* [ %p.addr.0.i6, %for.inc.i.i.preheader ], [ %0, %for.inc.i.i ]
  %n.i.i = getelementptr inbounds %struct.s* %p.addr.02.i.i, i64 0, i32 0
  %0 = load %struct.s** %n.i.i, align 8, !tbaa !0
  %tobool.i.i = icmp eq %struct.s* %0, null
  br i1 %tobool.i.i, label %if.then.i, label %for.inc.i.i

if.then.i:                                        ; preds = %for.inc.i.i
  %inc.i.i = add nsw i32 %inc.i.i7, 1
  %n.i = getelementptr inbounds %struct.s* %p.addr.0.i6, i64 0, i32 0
  %p.addr.0.i = load %struct.s** %n.i, align 8
  %tobool1.i.i = icmp eq %struct.s* %p.addr.0.i, null
  br i1 %tobool1.i.i, label %sub.exit, label %for.inc.i.i.preheader

sub.exit:                                         ; preds = %if.then.i
  %phitmp = add i32 %inc.i.i7, 2
  store i32 %phitmp, i32* @count, align 4, !tbaa !3
  %cmp3 = icmp eq i32 %phitmp, 12
  br i1 %cmp3, label %if.end, label %if.then

if.then:                                          ; preds = %sub.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %sub.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define void @sub(%struct.s* %p, %struct.s** nocapture %pp) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.then, %entry
  %p.addr.0 = phi %struct.s* [ %p, %entry ], [ %2, %if.then ]
  %tobool1.i = icmp eq %struct.s* %p.addr.0, null
  br i1 %tobool1.i, label %for.end, label %for.inc.i

for.inc.i:                                        ; preds = %for.cond, %for.inc.i
  %p.addr.02.i = phi %struct.s* [ %0, %for.inc.i ], [ %p.addr.0, %for.cond ]
  %n.i = getelementptr inbounds %struct.s* %p.addr.02.i, i64 0, i32 0
  %0 = load %struct.s** %n.i, align 8, !tbaa !0
  %tobool.i = icmp eq %struct.s* %0, null
  br i1 %tobool.i, label %if.then, label %for.inc.i

if.then:                                          ; preds = %for.inc.i
  store %struct.s* null, %struct.s** %pp, align 8, !tbaa !0
  %1 = load i32* @count, align 4, !tbaa !3
  %inc.i = add nsw i32 %1, 1
  store i32 %inc.i, i32* @count, align 4, !tbaa !3
  %n = getelementptr inbounds %struct.s* %p.addr.0, i64 0, i32 0
  %2 = load %struct.s** %n, align 8, !tbaa !0
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.s* null, %struct.s** %pp, align 8, !tbaa !0
  %3 = load i32* @count, align 4, !tbaa !3
  %inc.i2 = add nsw i32 %3, 1
  store i32 %inc.i2, i32* @count, align 4, !tbaa !3
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @look(%struct.s* %p, %struct.s** nocapture %pp) nounwind uwtable {
entry:
  %tobool1 = icmp eq %struct.s* %p, null
  br i1 %tobool1, label %for.end, label %for.inc

for.inc:                                          ; preds = %entry, %for.inc
  %p.addr.02 = phi %struct.s* [ %0, %for.inc ], [ %p, %entry ]
  %n = getelementptr inbounds %struct.s* %p.addr.02, i64 0, i32 0
  %0 = load %struct.s** %n, align 8, !tbaa !0
  %tobool = icmp eq %struct.s* %0, null
  br i1 %tobool, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc, %entry
  store %struct.s* null, %struct.s** %pp, align 8, !tbaa !0
  %1 = load i32* @count, align 4, !tbaa !3
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @count, align 4, !tbaa !3
  ret i32 1
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
