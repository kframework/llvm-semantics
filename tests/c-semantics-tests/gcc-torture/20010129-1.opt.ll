; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010129-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@baz1.l = internal unnamed_addr global i64 0, align 8
@bar = common global i8** null, align 8

define i64 @baz1(i8* nocapture %a) nounwind uwtable {
entry:
  %0 = load i64* @baz1.l, align 8, !tbaa !0
  %inc = add nsw i64 %0, 1
  store i64 %inc, i64* @baz1.l, align 8, !tbaa !0
  ret i64 %0
}

define i32 @baz2(i8* nocapture %a) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @baz3(i32 %i) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %i, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 1
}

declare void @abort() noreturn nounwind

define i32 @foo(i8* nocapture %a, i64 %b, i32 %c) nounwind uwtable {
entry.entry.split_crit_edge:
  %g = alloca [256 x i8], align 16
  %arrayidx = getelementptr inbounds [256 x i8]* %g, i64 0, i64 0
  store i8 10, i8* %arrayidx, align 16, !tbaa !1
  %arrayidx1 = getelementptr inbounds [256 x i8]* %g, i64 0, i64 1
  store i8 0, i8* %arrayidx1, align 1, !tbaa !1
  %and = and i32 %c, 16
  %cmp14 = icmp eq i32 %and, 0
  %0 = and i32 %c, 16400
  %1 = icmp eq i32 %0, 16400
  %2 = and i32 %c, 13834
  %3 = icmp eq i32 %2, 0
  %and57 = and i32 %c, 128
  %tobool58 = icmp eq i32 %and57, 0
  %4 = load i8*** @bar, align 8, !tbaa !3
  %tobool60 = icmp eq i8** %4, null
  %or.cond68 = or i1 %tobool58, %tobool60
  %5 = and i32 %c, 13832
  %6 = icmp eq i32 %5, 0
  %baz1.l.promoted.us100.pre = load i64* @baz1.l, align 8
  br i1 %cmp14, label %while.cond.us113, label %while.cond

if.then.us102:                                    ; preds = %while.cond.us113
  store i64 %inc.i.us115, i64* @baz1.l, align 8
  br label %while.cond.us113

while.cond.us113:                                 ; preds = %entry.entry.split_crit_edge, %if.then.us102
  %baz1.l.promoted.us100 = phi i64 [ %inc.i.us115, %if.then.us102 ], [ %baz1.l.promoted.us100.pre, %entry.entry.split_crit_edge ]
  %inc.i.us115 = add nsw i64 %baz1.l.promoted.us100, 1
  %cmp.us116 = icmp slt i64 %baz1.l.promoted.us100, %b
  br i1 %cmp.us116, label %if.then.us102, label %while.end

while.cond:                                       ; preds = %entry.entry.split_crit_edge, %land.lhs.true25, %if.end56, %if.end29
  %baz1.l.promoted = phi i64 [ %inc.i, %land.lhs.true25 ], [ %inc.i, %if.end56 ], [ %inc.i, %if.end29 ], [ %baz1.l.promoted.us100.pre, %entry.entry.split_crit_edge ]
  %d.0.ph = phi i32 [ %d.1164, %land.lhs.true25 ], [ %d.1163, %if.end56 ], [ 1, %if.end29 ], [ 0, %entry.entry.split_crit_edge ]
  %inc.i = add nsw i64 %baz1.l.promoted, 1
  %cmp = icmp slt i64 %baz1.l.promoted, %b
  br i1 %cmp, label %if.then, label %while.end

if.then:                                          ; preds = %while.cond
  store i64 %inc.i, i64* @baz1.l, align 8
  %tobool = icmp eq i32 %d.0.ph, 0
  br i1 %tobool, label %if.end17, label %land.lhs.true25

if.end17:                                         ; preds = %if.then
  br i1 %1, label %if.end29, label %land.lhs.true25

land.lhs.true25:                                  ; preds = %if.end17, %if.then
  %d.1164 = phi i32 [ 1, %if.end17 ], [ %d.0.ph, %if.then ]
  br i1 %3, label %if.end56, label %while.cond

if.end29:                                         ; preds = %if.end17
  br i1 %6, label %if.end56, label %while.cond

if.end56:                                         ; preds = %land.lhs.true25, %if.end29
  %d.1163 = phi i32 [ %d.1164, %land.lhs.true25 ], [ 1, %if.end29 ]
  br i1 %or.cond68, label %while.cond, label %for.body

for.body:                                         ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

while.end:                                        ; preds = %while.cond.us113, %while.cond
  %inc.i.lcssa.ph.ph.ph = phi i64 [ %inc.i.us115, %while.cond.us113 ], [ %inc.i, %while.cond ]
  store i64 %inc.i.lcssa.ph.ph.ph, i64* @baz1.l, align 8
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %g.i = alloca [256 x i8], align 16
  %n = alloca i8*, align 8
  store i8* null, i8** %n, align 8, !tbaa !3
  store i8** %n, i8*** @bar, align 8, !tbaa !3
  %0 = getelementptr inbounds [256 x i8]* %g.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  store i8 10, i8* %0, align 16, !tbaa !1
  %arrayidx1.i = getelementptr inbounds [256 x i8]* %g.i, i64 0, i64 1
  store i8 0, i8* %arrayidx1.i, align 1, !tbaa !1
  %baz1.l.promoted.us100.pre.i = load i64* @baz1.l, align 8
  %inc.i.i1 = add nsw i64 %baz1.l.promoted.us100.pre.i, 1
  %cmp.i2 = icmp slt i64 %baz1.l.promoted.us100.pre.i, 1
  %.inc.i.i1 = select i1 %cmp.i2, i64 2, i64 %inc.i.i1
  store i64 %.inc.i.i1, i64* @baz1.l, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
