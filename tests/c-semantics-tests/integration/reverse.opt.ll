; ModuleID = '/home/david/src/c-semantics/tests/integration/reverse.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

define %struct.list_el* @listAppend(%struct.list_el* %p, i32 %n) nounwind uwtable {
entry:
  %cmp = icmp eq %struct.list_el* %p, null
  br i1 %cmp, label %if.then, label %while.cond

if.then:                                          ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.list_el*
  %val = bitcast i8* %call to i32*
  store i32 %n, i32* %val, align 4, !tbaa !0
  %next = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %next to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %1, align 8, !tbaa !3
  br label %if.end

while.cond:                                       ; preds = %entry, %while.cond
  %x.0 = phi %struct.list_el* [ %2, %while.cond ], [ %p, %entry ]
  %next1 = getelementptr inbounds %struct.list_el* %x.0, i64 0, i32 1
  %2 = load %struct.list_el** %next1, align 8, !tbaa !3
  %cmp2 = icmp eq %struct.list_el* %2, null
  br i1 %cmp2, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %call5 = tail call noalias i8* @malloc(i64 16) nounwind
  %3 = bitcast i8* %call5 to %struct.list_el*
  store %struct.list_el* %3, %struct.list_el** %next1, align 8, !tbaa !3
  %val7 = bitcast i8* %call5 to i32*
  store i32 %n, i32* %val7, align 4, !tbaa !0
  %next8 = getelementptr inbounds i8* %call5, i64 8
  %4 = bitcast i8* %next8 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %4, align 8, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  %p.addr.0 = phi %struct.list_el* [ %0, %if.then ], [ %p, %while.end ]
  ret %struct.list_el* %p.addr.0
}

declare noalias i8* @malloc(i64) nounwind

define %struct.list_el* @listReverse(%struct.list_el* %p) nounwind uwtable {
entry:
  %cmp = icmp eq %struct.list_el* %p, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %next = getelementptr inbounds %struct.list_el* %p, i64 0, i32 1
  %0 = load %struct.list_el** %next, align 8, !tbaa !3
  store %struct.list_el* null, %struct.list_el** %next, align 8, !tbaa !3
  %cmp25 = icmp eq %struct.list_el* %0, null
  br i1 %cmp25, label %if.end, label %while.body

while.body:                                       ; preds = %if.then, %while.body
  %p.addr.07 = phi %struct.list_el* [ %x.06, %while.body ], [ %p, %if.then ]
  %x.06 = phi %struct.list_el* [ %1, %while.body ], [ %0, %if.then ]
  %next3 = getelementptr inbounds %struct.list_el* %x.06, i64 0, i32 1
  %1 = load %struct.list_el** %next3, align 8, !tbaa !3
  store %struct.list_el* %p.addr.07, %struct.list_el** %next3, align 8, !tbaa !3
  %cmp2 = icmp eq %struct.list_el* %1, null
  br i1 %cmp2, label %if.end, label %while.body

if.end:                                           ; preds = %if.then, %while.body, %entry
  %p.addr.1 = phi %struct.list_el* [ null, %entry ], [ %p, %if.then ], [ %x.06, %while.body ]
  ret %struct.list_el* %p.addr.1
}

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call.i to %struct.list_el*
  %val.i = bitcast i8* %call.i to i32*
  store i32 20, i32* %val.i, align 4, !tbaa !0
  %next.i = getelementptr inbounds i8* %call.i, i64 8
  %1 = bitcast i8* %next.i to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %1, align 8, !tbaa !3
  %cmp.i = icmp eq i8* %call.i, null
  br i1 %cmp.i, label %listAppend.exit35.thread, label %while.cond.i

while.cond.i:                                     ; preds = %entry, %while.cond.i
  %x.0.i = phi %struct.list_el* [ %2, %while.cond.i ], [ %0, %entry ]
  %next1.i = getelementptr inbounds %struct.list_el* %x.0.i, i64 0, i32 1
  %2 = load %struct.list_el** %next1.i, align 8, !tbaa !3
  %cmp2.i = icmp eq %struct.list_el* %2, null
  br i1 %cmp2.i, label %while.cond.i29.preheader, label %while.cond.i

while.cond.i29.preheader:                         ; preds = %while.cond.i
  %call5.i = tail call noalias i8* @malloc(i64 16) nounwind
  %3 = bitcast i8* %call5.i to %struct.list_el*
  store %struct.list_el* %3, %struct.list_el** %next1.i, align 8, !tbaa !3
  %val7.i = bitcast i8* %call5.i to i32*
  store i32 25, i32* %val7.i, align 4, !tbaa !0
  %next8.i = getelementptr inbounds i8* %call5.i, i64 8
  %4 = bitcast i8* %next8.i to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %4, align 8, !tbaa !3
  br label %while.cond.i29

listAppend.exit35.thread:                         ; preds = %entry
  %call.i18 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i19 = bitcast i8* %call.i18 to i32*
  store i32 25, i32* %val.i19, align 4, !tbaa !0
  %next.i20 = getelementptr inbounds i8* %call.i18, i64 8
  %5 = bitcast i8* %next.i20 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %5, align 8, !tbaa !3
  %call.i22 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i23 = bitcast i8* %call.i22 to i32*
  store i32 15, i32* %val.i23, align 4, !tbaa !0
  %next.i24 = getelementptr inbounds i8* %call.i22, i64 8
  %6 = bitcast i8* %next.i24 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %6, align 8, !tbaa !3
  br label %if.then.i55

while.cond.i29:                                   ; preds = %while.cond.i29.preheader, %while.cond.i29
  %x.0.i26 = phi %struct.list_el* [ %7, %while.cond.i29 ], [ %0, %while.cond.i29.preheader ]
  %next1.i27 = getelementptr inbounds %struct.list_el* %x.0.i26, i64 0, i32 1
  %7 = load %struct.list_el** %next1.i27, align 8, !tbaa !3
  %cmp2.i28 = icmp eq %struct.list_el* %7, null
  br i1 %cmp2.i28, label %listAppend.exit35, label %while.cond.i29

listAppend.exit35:                                ; preds = %while.cond.i29
  %call5.i30 = tail call noalias i8* @malloc(i64 16) nounwind
  %8 = bitcast i8* %call5.i30 to %struct.list_el*
  store %struct.list_el* %8, %struct.list_el** %next1.i27, align 8, !tbaa !3
  %val7.i31 = bitcast i8* %call5.i30 to i32*
  store i32 15, i32* %val7.i31, align 4, !tbaa !0
  %next8.i32 = getelementptr inbounds i8* %call5.i30, i64 8
  %9 = bitcast i8* %next8.i32 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %9, align 8, !tbaa !3
  br i1 %cmp.i, label %if.then.i55, label %while.cond.i44

while.cond.i44:                                   ; preds = %listAppend.exit35, %while.cond.i44
  %x.0.i41 = phi %struct.list_el* [ %10, %while.cond.i44 ], [ %0, %listAppend.exit35 ]
  %next1.i42 = getelementptr inbounds %struct.list_el* %x.0.i41, i64 0, i32 1
  %10 = load %struct.list_el** %next1.i42, align 8, !tbaa !3
  %cmp2.i43 = icmp eq %struct.list_el* %10, null
  br i1 %cmp2.i43, label %while.cond.i59.preheader, label %while.cond.i44

while.cond.i59.preheader:                         ; preds = %while.cond.i44
  %call5.i45 = tail call noalias i8* @malloc(i64 16) nounwind
  %11 = bitcast i8* %call5.i45 to %struct.list_el*
  store %struct.list_el* %11, %struct.list_el** %next1.i42, align 8, !tbaa !3
  %val7.i46 = bitcast i8* %call5.i45 to i32*
  store i32 30, i32* %val7.i46, align 4, !tbaa !0
  %next8.i47 = getelementptr inbounds i8* %call5.i45, i64 8
  %12 = bitcast i8* %next8.i47 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %12, align 8, !tbaa !3
  br label %while.cond.i59

if.then.i55:                                      ; preds = %listAppend.exit35, %listAppend.exit35.thread
  %call.i37 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i38 = bitcast i8* %call.i37 to i32*
  store i32 30, i32* %val.i38, align 4, !tbaa !0
  %next.i39 = getelementptr inbounds i8* %call.i37, i64 8
  %13 = bitcast i8* %next.i39 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %13, align 8, !tbaa !3
  %call.i52 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i53 = bitcast i8* %call.i52 to i32*
  store i32 10, i32* %val.i53, align 4, !tbaa !0
  %next.i54 = getelementptr inbounds i8* %call.i52, i64 8
  %14 = bitcast i8* %next.i54 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %14, align 8, !tbaa !3
  br label %listAppend.exit65

while.cond.i59:                                   ; preds = %while.cond.i59.preheader, %while.cond.i59
  %x.0.i56 = phi %struct.list_el* [ %15, %while.cond.i59 ], [ %0, %while.cond.i59.preheader ]
  %next1.i57 = getelementptr inbounds %struct.list_el* %x.0.i56, i64 0, i32 1
  %15 = load %struct.list_el** %next1.i57, align 8, !tbaa !3
  %cmp2.i58 = icmp eq %struct.list_el* %15, null
  br i1 %cmp2.i58, label %while.end.i63, label %while.cond.i59

while.end.i63:                                    ; preds = %while.cond.i59
  %call5.i60 = tail call noalias i8* @malloc(i64 16) nounwind
  %16 = bitcast i8* %call5.i60 to %struct.list_el*
  store %struct.list_el* %16, %struct.list_el** %next1.i57, align 8, !tbaa !3
  %val7.i61 = bitcast i8* %call5.i60 to i32*
  store i32 10, i32* %val7.i61, align 4, !tbaa !0
  %next8.i62 = getelementptr inbounds i8* %call5.i60, i64 8
  %17 = bitcast i8* %next8.i62 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %17, align 8, !tbaa !3
  br label %listAppend.exit65

listAppend.exit65:                                ; preds = %if.then.i55, %while.end.i63
  br i1 %cmp.i, label %while.cond.preheader.thread, label %while.cond.i74

while.cond.preheader.thread:                      ; preds = %listAppend.exit65
  %call.i67 = tail call noalias i8* @malloc(i64 16) nounwind
  %val.i68 = bitcast i8* %call.i67 to i32*
  store i32 35, i32* %val.i68, align 4, !tbaa !0
  %next.i69 = getelementptr inbounds i8* %call.i67, i64 8
  %18 = bitcast i8* %next.i69 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %18, align 8, !tbaa !3
  br label %while.end

while.cond.i74:                                   ; preds = %listAppend.exit65, %while.cond.i74
  %x.0.i71 = phi %struct.list_el* [ %19, %while.cond.i74 ], [ %0, %listAppend.exit65 ]
  %next1.i72 = getelementptr inbounds %struct.list_el* %x.0.i71, i64 0, i32 1
  %19 = load %struct.list_el** %next1.i72, align 8, !tbaa !3
  %cmp2.i73 = icmp eq %struct.list_el* %19, null
  br i1 %cmp2.i73, label %while.cond.preheader, label %while.cond.i74

while.cond.preheader:                             ; preds = %while.cond.i74
  %call5.i75 = tail call noalias i8* @malloc(i64 16) nounwind
  %20 = bitcast i8* %call5.i75 to %struct.list_el*
  store %struct.list_el* %20, %struct.list_el** %next1.i72, align 8, !tbaa !3
  %val7.i76 = bitcast i8* %call5.i75 to i32*
  store i32 35, i32* %val7.i76, align 4, !tbaa !0
  %next8.i77 = getelementptr inbounds i8* %call5.i75, i64 8
  %21 = bitcast i8* %next8.i77 to %struct.list_el**
  store %struct.list_el* null, %struct.list_el** %21, align 8, !tbaa !3
  %cmp88 = icmp eq i8* %call.i, null
  br i1 %cmp88, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.preheader, %while.body
  %curr.089 = phi %struct.list_el* [ %23, %while.body ], [ %0, %while.cond.preheader ]
  %val = getelementptr inbounds %struct.list_el* %curr.089, i64 0, i32 0
  %22 = load i32* %val, align 4, !tbaa !0
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %22) nounwind
  %next = getelementptr inbounds %struct.list_el* %curr.089, i64 0, i32 1
  %23 = load %struct.list_el** %next, align 8, !tbaa !3
  %cmp = icmp eq %struct.list_el* %23, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %while.cond.preheader.thread, %while.cond.preheader
  %putchar = tail call i32 @putchar(i32 10) nounwind
  br i1 %cmp.i, label %while.end16, label %if.then.i83

if.then.i83:                                      ; preds = %while.end
  %24 = load %struct.list_el** %1, align 8, !tbaa !3
  store %struct.list_el* null, %struct.list_el** %1, align 8, !tbaa !3
  %cmp25.i = icmp eq %struct.list_el* %24, null
  br i1 %cmp25.i, label %while.cond10.preheader, label %while.body.i

while.body.i:                                     ; preds = %if.then.i83, %while.body.i
  %p.addr.07.i = phi %struct.list_el* [ %x.06.i, %while.body.i ], [ %0, %if.then.i83 ]
  %x.06.i = phi %struct.list_el* [ %25, %while.body.i ], [ %24, %if.then.i83 ]
  %next3.i = getelementptr inbounds %struct.list_el* %x.06.i, i64 0, i32 1
  %25 = load %struct.list_el** %next3.i, align 8, !tbaa !3
  store %struct.list_el* %p.addr.07.i, %struct.list_el** %next3.i, align 8, !tbaa !3
  %cmp2.i84 = icmp eq %struct.list_el* %25, null
  br i1 %cmp2.i84, label %while.body12, label %while.body.i

while.cond10.preheader:                           ; preds = %if.then.i83
  %cmp1186 = icmp eq i8* %call.i, null
  br i1 %cmp1186, label %while.end16, label %while.body12

while.body12:                                     ; preds = %while.body.i, %while.cond10.preheader, %while.body12
  %curr.187 = phi %struct.list_el* [ %27, %while.body12 ], [ %0, %while.cond10.preheader ], [ %x.06.i, %while.body.i ]
  %val13 = getelementptr inbounds %struct.list_el* %curr.187, i64 0, i32 0
  %26 = load i32* %val13, align 4, !tbaa !0
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %26) nounwind
  %next15 = getelementptr inbounds %struct.list_el* %curr.187, i64 0, i32 1
  %27 = load %struct.list_el** %next15, align 8, !tbaa !3
  %cmp11 = icmp eq %struct.list_el* %27, null
  br i1 %cmp11, label %while.end16, label %while.body12

while.end16:                                      ; preds = %while.end, %while.body12, %while.cond10.preheader
  %putchar85 = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
