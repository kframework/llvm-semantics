; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020129-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { %struct.A*, %struct.C* }
%struct.B = type { %struct.C, %struct.A* }
%struct.C = type { %struct.D, i64, i64, i64, i64, i64 }
%struct.D = type { i32, %struct.D* }

@y = common global %struct.B zeroinitializer, align 8
@x = common global %struct.B zeroinitializer, align 8

define void @foo(%struct.B* %x, %struct.B* %y) nounwind uwtable {
entry:
  %b2 = getelementptr inbounds %struct.B* %x, i64 0, i32 1
  %tmp1 = load %struct.A** %b2, align 8
  %cmp = icmp eq %struct.A* %tmp1, null
  %b24 = getelementptr inbounds %struct.B* %y, i64 0, i32 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp5 = load %struct.A** %b24, align 8
  store %struct.A* %tmp5, %struct.A** %b2, align 8
  store %struct.A* null, %struct.A** %b24, align 8
  %tobool2 = icmp eq %struct.A* %tmp5, null
  br i1 %tobool2, label %if.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.then
  %b1 = getelementptr inbounds %struct.B* %x, i64 0, i32 0
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %tmp1413 = phi %struct.A* [ %tmp5, %for.body.lr.ph ], [ %tmp14, %for.body ]
  %a2 = getelementptr inbounds %struct.A* %tmp1413, i64 0, i32 1
  store %struct.C* %b1, %struct.C** %a2, align 8
  %a1 = getelementptr inbounds %struct.A* %tmp1413, i64 0, i32 0
  %tmp14 = load %struct.A** %a1, align 8
  %tobool = icmp eq %struct.A* %tmp14, null
  br i1 %tobool, label %if.end, label %for.body

if.end:                                           ; preds = %entry, %if.then, %for.body
  %tmp17 = load %struct.A** %b24, align 8
  %cmp18 = icmp eq %struct.A* %tmp17, null
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end
  %c3 = getelementptr inbounds %struct.B* %x, i64 0, i32 0, i32 2
  %tmp23 = load i64* %c3, align 8
  %cmp24 = icmp eq i64 %tmp23, -1
  %c328 = getelementptr inbounds %struct.B* %y, i64 0, i32 0, i32 2
  %tmp29 = load i64* %c328, align 8
  br i1 %cmp24, label %if.end45.thread, label %if.end45

if.end45.thread:                                  ; preds = %if.end20
  store i64 %tmp29, i64* %c3, align 8
  %c4 = getelementptr inbounds %struct.B* %y, i64 0, i32 0, i32 3
  %tmp35 = load i64* %c4, align 8
  %c438 = getelementptr inbounds %struct.B* %x, i64 0, i32 0, i32 3
  store i64 %tmp35, i64* %c438, align 8
  store i64 -1, i64* %c328, align 8
  store i64 0, i64* %c4, align 8
  br label %if.end52

if.end45:                                         ; preds = %if.end20
  %phitmp = icmp eq i64 %tmp29, -1
  br i1 %phitmp, label %if.end52, label %if.then51

if.then51:                                        ; preds = %if.end45
  tail call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end45.thread, %if.end45
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 6, i32* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 0, i32 0), align 8
  store i64 145, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 2), align 8
  store i64 2448, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 3), align 8
  store i64 -1, i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 2), align 8
  %tmp1.i = load %struct.A** getelementptr inbounds (%struct.B* @x, i64 0, i32 1), align 8
  %cmp.i = icmp eq %struct.A* %tmp1.i, null
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %tmp5.i = load %struct.A** getelementptr inbounds (%struct.B* @y, i64 0, i32 1), align 8
  store %struct.A* %tmp5.i, %struct.A** getelementptr inbounds (%struct.B* @x, i64 0, i32 1), align 8
  store %struct.A* null, %struct.A** getelementptr inbounds (%struct.B* @y, i64 0, i32 1), align 8
  %tobool2.i = icmp eq %struct.A* %tmp5.i, null
  br i1 %tobool2.i, label %if.end45.thread.i, label %for.body.i

for.body.i:                                       ; preds = %if.then.i, %for.body.i
  %tmp1413.i = phi %struct.A* [ %tmp14.i, %for.body.i ], [ %tmp5.i, %if.then.i ]
  %a2.i = getelementptr inbounds %struct.A* %tmp1413.i, i64 0, i32 1
  store %struct.C* getelementptr inbounds (%struct.B* @x, i64 0, i32 0), %struct.C** %a2.i, align 8
  %a1.i = getelementptr inbounds %struct.A* %tmp1413.i, i64 0, i32 0
  %tmp14.i = load %struct.A** %a1.i, align 8
  %tobool.i = icmp eq %struct.A* %tmp14.i, null
  br i1 %tobool.i, label %if.end.i, label %for.body.i

if.end.i:                                         ; preds = %for.body.i, %entry
  %tmp17.i.pr = load %struct.A** getelementptr inbounds (%struct.B* @y, i64 0, i32 1), align 8
  %cmp18.i = icmp eq %struct.A* %tmp17.i.pr, null
  br i1 %cmp18.i, label %if.end20.i, label %if.then19.i

if.then19.i:                                      ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end20.i:                                       ; preds = %if.end.i
  %tmp23.i.pre = load i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 2), align 8
  %tmp29.i.pre = load i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 2), align 8
  %phitmp = icmp eq i64 %tmp23.i.pre, -1
  br i1 %phitmp, label %if.end45.thread.i, label %if.end45.i

if.end45.thread.i:                                ; preds = %if.then.i, %if.end20.i
  %tmp29.i4 = phi i64 [ %tmp29.i.pre, %if.end20.i ], [ 145, %if.then.i ]
  store i64 %tmp29.i4, i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 2), align 8
  %tmp35.i = load i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 3), align 8
  store i64 %tmp35.i, i64* getelementptr inbounds (%struct.B* @x, i64 0, i32 0, i32 3), align 8
  store i64 -1, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 2), align 8
  store i64 0, i64* getelementptr inbounds (%struct.B* @y, i64 0, i32 0, i32 3), align 8
  br label %foo.exit

if.end45.i:                                       ; preds = %if.end20.i
  %phitmp.i = icmp eq i64 %tmp29.i.pre, -1
  br i1 %phitmp.i, label %foo.exit, label %if.then51.i

if.then51.i:                                      ; preds = %if.end45.i
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %if.end45.thread.i, %if.end45.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
