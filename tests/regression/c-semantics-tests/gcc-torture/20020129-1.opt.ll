; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020129-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { %struct.C, %struct.A* }
%struct.C = type { %struct.D, i64, i64, i64, i64, i64 }
%struct.D = type { i32, %struct.D* }
%struct.A = type { %struct.A*, %struct.C* }

@y = common global %struct.B zeroinitializer, align 8
@x = common global %struct.B zeroinitializer, align 8

define void @foo(%struct.B* %x, %struct.B* nocapture %y) nounwind uwtable {
entry:
  %b2 = getelementptr inbounds %struct.B* %x, i64 0, i32 1
  %0 = load %struct.A** %b2, align 8, !tbaa !0
  %cmp = icmp eq %struct.A* %0, null
  %b21 = getelementptr inbounds %struct.B* %y, i64 0, i32 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.A** %b21, align 8, !tbaa !0
  store %struct.A* %1, %struct.A** %b2, align 8, !tbaa !0
  store %struct.A* null, %struct.A** %b21, align 8, !tbaa !0
  %tobool28 = icmp eq %struct.A* %1, null
  br i1 %tobool28, label %if.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.then
  %b1 = getelementptr inbounds %struct.B* %x, i64 0, i32 0
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %a.029 = phi %struct.A* [ %1, %for.body.lr.ph ], [ %2, %for.body ]
  %a2 = getelementptr inbounds %struct.A* %a.029, i64 0, i32 1
  store %struct.C* %b1, %struct.C** %a2, align 8, !tbaa !0
  %a1 = getelementptr inbounds %struct.A* %a.029, i64 0, i32 0
  %2 = load %struct.A** %a1, align 8, !tbaa !0
  %tobool = icmp eq %struct.A* %2, null
  br i1 %tobool, label %if.end, label %for.body

if.end:                                           ; preds = %entry, %if.then, %for.body
  %3 = load %struct.A** %b21, align 8, !tbaa !0
  %cmp5 = icmp eq %struct.A* %3, null
  br i1 %cmp5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %c3 = getelementptr inbounds %struct.B* %x, i64 0, i32 0, i32 2
  %4 = load i64* %c3, align 8, !tbaa !3
  %cmp9 = icmp eq i64 %4, -1
  %c312 = getelementptr inbounds %struct.B* %y, i64 0, i32 0, i32 2
  %5 = load i64* %c312, align 8, !tbaa !3
  br i1 %cmp9, label %if.end22.thread, label %if.end22

if.end22.thread:                                  ; preds = %if.end7
  store i64 %5, i64* %c3, align 8, !tbaa !3
  %c4 = getelementptr inbounds %struct.B* %y, i64 0, i32 0, i32 3
  %6 = load i64* %c4, align 8, !tbaa !3
  %c417 = getelementptr inbounds %struct.B* %x, i64 0, i32 0, i32 3
  store i64 %6, i64* %c417, align 8, !tbaa !3
  store i64 -1, i64* %c312, align 8, !tbaa !3
  store i64 0, i64* %c4, align 8, !tbaa !3
  br label %if.end27

if.end22:                                         ; preds = %if.end7
  %phitmp = icmp eq i64 %5, -1
  br i1 %phitmp, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end22
  tail call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end22.thread, %if.end22
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 6, i32* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !4
  store i64 145, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 2), align 8, !tbaa !3
  store i64 2448, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 3), align 8, !tbaa !3
  store i64 -1, i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 2), align 8, !tbaa !3
  %0 = load %struct.A** getelementptr inbounds (%struct.B* @x, i64 0, i32 1), align 8, !tbaa !0
  %cmp.i = icmp eq %struct.A* %0, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %1 = load %struct.A** getelementptr inbounds (%struct.B* @y, i64 0, i32 1), align 8, !tbaa !0
  store %struct.A* %1, %struct.A** getelementptr inbounds (%struct.B* @x, i64 0, i32 1), align 8, !tbaa !0
  store %struct.A* null, %struct.A** getelementptr inbounds (%struct.B* @y, i64 0, i32 1), align 8, !tbaa !0
  %tobool28.i = icmp eq %struct.A* %1, null
  br i1 %tobool28.i, label %foo.exit, label %for.body.i

for.body.i:                                       ; preds = %if.then.i, %for.body.i
  %a.029.i = phi %struct.A* [ %2, %for.body.i ], [ %1, %if.then.i ]
  %a2.i = getelementptr inbounds %struct.A* %a.029.i, i64 0, i32 1
  store %struct.C* getelementptr inbounds (%struct.B* @x, i64 0, i32 0), %struct.C** %a2.i, align 8, !tbaa !0
  %a1.i = getelementptr inbounds %struct.A* %a.029.i, i64 0, i32 0
  %2 = load %struct.A** %a1.i, align 8, !tbaa !0
  %tobool.i = icmp eq %struct.A* %2, null
  br i1 %tobool.i, label %if.end.i, label %for.body.i

if.end.i:                                         ; preds = %for.body.i, %entry
  %.pr = load %struct.A** getelementptr inbounds (%struct.B* @y, i64 0, i32 1), align 8, !tbaa !0
  %cmp5.i = icmp eq %struct.A* %.pr, null
  br i1 %cmp5.i, label %foo.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %if.then.i, %if.end.i
  store i64 145, i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 2), align 8, !tbaa !3
  store i64 2448, i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 3), align 8, !tbaa !3
  store i64 -1, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 2), align 8, !tbaa !3
  store i64 0, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 3), align 8, !tbaa !3
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long", metadata !1}
!4 = metadata !{metadata !"int", metadata !1}
