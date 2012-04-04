; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr39100.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.E = type { i32, %struct.E* }
%struct.C = type { %struct.E*, i16, i16 }

@main.c = private unnamed_addr constant { %struct.E*, i16, i16, [4 x i8] } { %struct.E* null, i16 0, i16 0, [4 x i8] undef }, align 8

define %struct.C* @foo(%struct.C* %h, %struct.E* %x) nounwind uwtable noinline {
entry:
  %pl = alloca %struct.E*, align 8
  %nl = alloca %struct.E*, align 8
  store %struct.E* null, %struct.E** %pl, align 8, !tbaa !0
  store %struct.E* null, %struct.E** %nl, align 8, !tbaa !0
  %cn = getelementptr inbounds %struct.C* %h, i64 0, i32 1
  %cp = getelementptr inbounds %struct.C* %h, i64 0, i32 2
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.then, %entry
  %pa.0.ph = phi %struct.E** [ %pl, %entry ], [ %n1, %if.then ]
  %x.addr.0.ph = phi %struct.E* [ %x, %entry ], [ %0, %if.then ]
  %na.0.ph = phi %struct.E** [ %nl, %entry ], [ %na.0, %if.then ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %if.else
  %x.addr.0 = phi %struct.E* [ %0, %if.else ], [ %x.addr.0.ph, %while.cond.outer ]
  %na.0 = phi %struct.E** [ %n1, %if.else ], [ %na.0.ph, %while.cond.outer ]
  %tobool = icmp eq %struct.E* %x.addr.0, null
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %n1 = getelementptr inbounds %struct.E* %x.addr.0, i64 0, i32 1
  %0 = load %struct.E** %n1, align 8, !tbaa !0
  %p = getelementptr inbounds %struct.E* %x.addr.0, i64 0, i32 0
  %1 = load i32* %p, align 4, !tbaa !3
  %and = and i32 %1, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %2 = load i16* %cp, align 2, !tbaa !4
  %inc = add i16 %2, 1
  store i16 %inc, i16* %cp, align 2, !tbaa !4
  store %struct.E* %x.addr.0, %struct.E** %pa.0.ph, align 8, !tbaa !0
  br label %while.cond.outer

if.else:                                          ; preds = %while.body
  %3 = load i16* %cn, align 2, !tbaa !4
  %inc3 = add i16 %3, 1
  store i16 %inc3, i16* %cn, align 2, !tbaa !4
  store %struct.E* %x.addr.0, %struct.E** %na.0, align 8, !tbaa !0
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.E** %nl, align 8, !tbaa !0
  store %struct.E* %4, %struct.E** %pa.0.ph, align 8, !tbaa !0
  store %struct.E* null, %struct.E** %na.0, align 8, !tbaa !0
  %5 = load %struct.E** %pl, align 8, !tbaa !0
  %x5 = getelementptr inbounds %struct.C* %h, i64 0, i32 0
  store %struct.E* %5, %struct.E** %x5, align 8, !tbaa !0
  ret %struct.C* %h
}

define i32 @main() nounwind uwtable {
entry:
  %c = alloca %struct.C, align 8
  %e = alloca [2 x %struct.E], align 16
  %0 = bitcast %struct.C* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ({ %struct.E*, i16, i16, [4 x i8] }* @main.c to i8*), i64 16, i32 8, i1 false)
  %p = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0, i32 0
  store i32 0, i32* %p, align 16, !tbaa !3
  %n = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0, i32 1
  %arrayidx = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 1
  store %struct.E* %arrayidx, %struct.E** %n, align 8, !tbaa !0
  %p1 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 1, i32 0
  store i32 1, i32* %p1, align 16, !tbaa !3
  %n2 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 1, i32 1
  store %struct.E* null, %struct.E** %n2, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0
  %call = call %struct.C* @foo(%struct.C* %c, %struct.E* %arrayidx4)
  %cn = getelementptr inbounds %struct.C* %c, i64 0, i32 1
  %1 = bitcast i16* %cn to i32*
  %2 = load i32* %1, align 8
  %3 = icmp eq i32 %2, 65537
  br i1 %3, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %x = getelementptr inbounds %struct.C* %c, i64 0, i32 0
  %4 = load %struct.E** %x, align 8, !tbaa !0
  %cmp10 = icmp eq %struct.E* %4, %arrayidx
  br i1 %cmp10, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end
  %5 = load %struct.E** %n2, align 8, !tbaa !0
  %cmp17 = icmp eq %struct.E* %5, %arrayidx4
  br i1 %cmp17, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end13
  %6 = load %struct.E** %n, align 8, !tbaa !0
  %tobool = icmp eq %struct.E* %6, null
  br i1 %tobool, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{metadata !"short", metadata !1}
