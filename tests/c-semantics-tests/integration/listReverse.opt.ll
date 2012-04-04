; ModuleID = '/home/david/src/c-semantics/tests/integration/listReverse.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32 20, i32* %0, align 4, !tbaa !0
  %add.ptr = getelementptr inbounds i8* %call, i64 4
  %1 = bitcast i8* %add.ptr to i32**
  store i32* null, i32** %1, align 8, !tbaa !3
  %cmp.i = icmp eq i8* %call, null
  br i1 %cmp.i, label %while.end.thread, label %while.cond.i

while.end.thread:                                 ; preds = %entry
  %putchar92 = tail call i32 @putchar(i32 10) nounwind
  br label %listSum.exit.thread

while.cond.i:                                     ; preds = %entry, %while.cond.i
  %x.0.i = phi i32* [ %3, %while.cond.i ], [ %0, %entry ]
  %add.ptr.i = getelementptr inbounds i32* %x.0.i, i64 1
  %2 = bitcast i32* %add.ptr.i to i32**
  %3 = load i32** %2, align 8, !tbaa !3
  %cmp1.i = icmp eq i32* %3, null
  br i1 %cmp1.i, label %while.cond.i24.preheader, label %while.cond.i

while.cond.i24.preheader:                         ; preds = %while.cond.i
  %call.i = tail call noalias i8* @malloc(i64 12) nounwind
  %4 = bitcast i8* %call.i to i32*
  store i32* %4, i32** %2, align 8, !tbaa !3
  store i32 25, i32* %4, align 4, !tbaa !0
  %add.ptr4.i = getelementptr inbounds i8* %call.i, i64 4
  %5 = bitcast i8* %add.ptr4.i to i32**
  store i32* null, i32** %5, align 8, !tbaa !3
  br label %while.cond.i24

while.cond.i24:                                   ; preds = %while.cond.i24.preheader, %while.cond.i24
  %x.0.i21 = phi i32* [ %7, %while.cond.i24 ], [ %0, %while.cond.i24.preheader ]
  %add.ptr.i22 = getelementptr inbounds i32* %x.0.i21, i64 1
  %6 = bitcast i32* %add.ptr.i22 to i32**
  %7 = load i32** %6, align 8, !tbaa !3
  %cmp1.i23 = icmp eq i32* %7, null
  br i1 %cmp1.i23, label %while.cond.i33.preheader, label %while.cond.i24

while.cond.i33.preheader:                         ; preds = %while.cond.i24
  %call.i25 = tail call noalias i8* @malloc(i64 12) nounwind
  %8 = bitcast i8* %call.i25 to i32*
  store i32* %8, i32** %6, align 8, !tbaa !3
  store i32 15, i32* %8, align 4, !tbaa !0
  %add.ptr4.i26 = getelementptr inbounds i8* %call.i25, i64 4
  %9 = bitcast i8* %add.ptr4.i26 to i32**
  store i32* null, i32** %9, align 8, !tbaa !3
  br label %while.cond.i33

while.cond.i33:                                   ; preds = %while.cond.i33.preheader, %while.cond.i33
  %x.0.i30 = phi i32* [ %11, %while.cond.i33 ], [ %0, %while.cond.i33.preheader ]
  %add.ptr.i31 = getelementptr inbounds i32* %x.0.i30, i64 1
  %10 = bitcast i32* %add.ptr.i31 to i32**
  %11 = load i32** %10, align 8, !tbaa !3
  %cmp1.i32 = icmp eq i32* %11, null
  br i1 %cmp1.i32, label %while.cond.i42.preheader, label %while.cond.i33

while.cond.i42.preheader:                         ; preds = %while.cond.i33
  %call.i34 = tail call noalias i8* @malloc(i64 12) nounwind
  %12 = bitcast i8* %call.i34 to i32*
  store i32* %12, i32** %10, align 8, !tbaa !3
  store i32 30, i32* %12, align 4, !tbaa !0
  %add.ptr4.i35 = getelementptr inbounds i8* %call.i34, i64 4
  %13 = bitcast i8* %add.ptr4.i35 to i32**
  store i32* null, i32** %13, align 8, !tbaa !3
  br label %while.cond.i42

while.cond.i42:                                   ; preds = %while.cond.i42.preheader, %while.cond.i42
  %x.0.i39 = phi i32* [ %15, %while.cond.i42 ], [ %0, %while.cond.i42.preheader ]
  %add.ptr.i40 = getelementptr inbounds i32* %x.0.i39, i64 1
  %14 = bitcast i32* %add.ptr.i40 to i32**
  %15 = load i32** %14, align 8, !tbaa !3
  %cmp1.i41 = icmp eq i32* %15, null
  br i1 %cmp1.i41, label %while.cond.i51.preheader, label %while.cond.i42

while.cond.i51.preheader:                         ; preds = %while.cond.i42
  %call.i43 = tail call noalias i8* @malloc(i64 12) nounwind
  %16 = bitcast i8* %call.i43 to i32*
  store i32* %16, i32** %14, align 8, !tbaa !3
  store i32 10, i32* %16, align 4, !tbaa !0
  %add.ptr4.i44 = getelementptr inbounds i8* %call.i43, i64 4
  %17 = bitcast i8* %add.ptr4.i44 to i32**
  store i32* null, i32** %17, align 8, !tbaa !3
  br label %while.cond.i51

while.cond.i51:                                   ; preds = %while.cond.i51.preheader, %while.cond.i51
  %x.0.i48 = phi i32* [ %19, %while.cond.i51 ], [ %0, %while.cond.i51.preheader ]
  %add.ptr.i49 = getelementptr inbounds i32* %x.0.i48, i64 1
  %18 = bitcast i32* %add.ptr.i49 to i32**
  %19 = load i32** %18, align 8, !tbaa !3
  %cmp1.i50 = icmp eq i32* %19, null
  br i1 %cmp1.i50, label %while.cond.preheader, label %while.cond.i51

while.cond.preheader:                             ; preds = %while.cond.i51
  %call.i52 = tail call noalias i8* @malloc(i64 12) nounwind
  %20 = bitcast i8* %call.i52 to i32*
  store i32* %20, i32** %18, align 8, !tbaa !3
  store i32 35, i32* %20, align 4, !tbaa !0
  %add.ptr4.i53 = getelementptr inbounds i8* %call.i52, i64 4
  %21 = bitcast i8* %add.ptr4.i53 to i32**
  store i32* null, i32** %21, align 8, !tbaa !3
  %cmp85 = icmp eq i8* %call, null
  br i1 %cmp85, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond.preheader, %while.body
  %curr.086 = phi i32* [ %24, %while.body ], [ %0, %while.cond.preheader ]
  %22 = load i32* %curr.086, align 4, !tbaa !0
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %22) nounwind
  %add.ptr7 = getelementptr inbounds i32* %curr.086, i64 1
  %23 = bitcast i32* %add.ptr7 to i32**
  %24 = load i32** %23, align 8, !tbaa !3
  %cmp = icmp eq i32* %24, null
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %while.cond.preheader
  %putchar = tail call i32 @putchar(i32 10) nounwind
  br i1 %cmp.i, label %listSum.exit.thread, label %if.then.i

listSum.exit.thread:                              ; preds = %while.end.thread, %while.end
  call void @llvm.trap()
  unreachable

if.then.i:                                        ; preds = %while.end
  %25 = load i32* %0, align 4, !tbaa !0
  %26 = load i32** %1, align 8, !tbaa !3
  %cmp15.i = icmp eq i32* %26, null
  br i1 %cmp15.i, label %if.then.i73.thread, label %while.body.i

if.then.i73.thread:                               ; preds = %if.then.i
  store i32* null, i32** %1, align 8, !tbaa !3
  br label %listReverse.exit.thread

while.body.i:                                     ; preds = %if.then.i, %while.body.i
  %27 = phi i32* [ %30, %while.body.i ], [ %26, %if.then.i ]
  %sum.06.i = phi i32 [ %add3.i, %while.body.i ], [ %25, %if.then.i ]
  %28 = load i32* %27, align 4, !tbaa !0
  %add3.i = add nsw i32 %28, %sum.06.i
  %add.ptr.i58 = getelementptr inbounds i32* %27, i64 1
  %29 = bitcast i32* %add.ptr.i58 to i32**
  %30 = load i32** %29, align 8, !tbaa !3
  %cmp1.i59 = icmp eq i32* %30, null
  br i1 %cmp1.i59, label %if.then.i73, label %while.body.i

if.then.i73:                                      ; preds = %while.body.i
  store i32* null, i32** %1, align 8, !tbaa !3
  br i1 %cmp15.i, label %listReverse.exit, label %while.body.i74

while.body.i74:                                   ; preds = %if.then.i73, %while.body.i74
  %p.addr.07.i = phi i32* [ %x.06.i, %while.body.i74 ], [ %0, %if.then.i73 ]
  %x.06.i = phi i32* [ %32, %while.body.i74 ], [ %26, %if.then.i73 ]
  %add.ptr3.i = getelementptr inbounds i32* %x.06.i, i64 1
  %31 = bitcast i32* %add.ptr3.i to i32**
  %32 = load i32** %31, align 8, !tbaa !3
  store i32* %p.addr.07.i, i32** %31, align 8, !tbaa !3
  %cmp2.i = icmp eq i32* %32, null
  br i1 %cmp2.i, label %listReverse.exit.thread, label %while.body.i74

listReverse.exit.thread:                          ; preds = %if.then.i73.thread, %while.body.i74
  %sum.1.i7893.ph = phi i32 [ %25, %if.then.i73.thread ], [ %add3.i, %while.body.i74 ]
  %p.addr.1.i.ph = phi i32* [ %0, %if.then.i73.thread ], [ %x.06.i, %while.body.i74 ]
  %cmp128394 = icmp eq i32* %p.addr.1.i.ph, null
  br label %while.body13.lr.ph

listReverse.exit:                                 ; preds = %if.then.i73
  %cmp1283 = icmp eq i8* %call, null
  br i1 %cmp1283, label %while.end16.thread, label %while.body13.lr.ph

while.end16.thread:                               ; preds = %listReverse.exit
  %putchar75101 = tail call i32 @putchar(i32 10) nounwind
  store i32 undef, i32* null, align 536870912
  br label %listSum.exit70

while.body13.lr.ph:                               ; preds = %listReverse.exit.thread, %listReverse.exit
  %cmp128399 = phi i1 [ %cmp128394, %listReverse.exit.thread ], [ false, %listReverse.exit ]
  %p.addr.1.i97 = phi i32* [ %p.addr.1.i.ph, %listReverse.exit.thread ], [ %0, %listReverse.exit ]
  %sum.1.i789395 = phi i32 [ %sum.1.i7893.ph, %listReverse.exit.thread ], [ %add3.i, %listReverse.exit ]
  br label %while.body13

while.body13:                                     ; preds = %while.body13.lr.ph, %while.body13
  %curr.184 = phi i32* [ %p.addr.1.i97, %while.body13.lr.ph ], [ %35, %while.body13 ]
  %33 = load i32* %curr.184, align 4, !tbaa !0
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %33) nounwind
  %add.ptr15 = getelementptr inbounds i32* %curr.184, i64 1
  %34 = bitcast i32* %add.ptr15 to i32**
  %35 = load i32** %34, align 8, !tbaa !3
  %cmp12 = icmp eq i32* %35, null
  br i1 %cmp12, label %while.end16, label %while.body13

while.end16:                                      ; preds = %while.body13
  %putchar75 = tail call i32 @putchar(i32 10) nounwind
  %36 = load i32* %p.addr.1.i97, align 4, !tbaa !0
  br i1 %cmp128399, label %listSum.exit70, label %if.then.i63

if.then.i63:                                      ; preds = %while.end16
  %add.ptr4.i61 = getelementptr inbounds i32* %p.addr.1.i97, i64 1
  %37 = bitcast i32* %add.ptr4.i61 to i32**
  %38 = load i32** %37, align 8, !tbaa !3
  %cmp15.i62 = icmp eq i32* %38, null
  br i1 %cmp15.i62, label %listSum.exit70, label %while.body.i68

while.body.i68:                                   ; preds = %if.then.i63, %while.body.i68
  %39 = phi i32* [ %42, %while.body.i68 ], [ %38, %if.then.i63 ]
  %sum.06.i64 = phi i32 [ %add3.i65, %while.body.i68 ], [ %36, %if.then.i63 ]
  %40 = load i32* %39, align 4, !tbaa !0
  %add3.i65 = add nsw i32 %40, %sum.06.i64
  %add.ptr.i66 = getelementptr inbounds i32* %39, i64 1
  %41 = bitcast i32* %add.ptr.i66 to i32**
  %42 = load i32** %41, align 8, !tbaa !3
  %cmp1.i67 = icmp eq i32* %42, null
  br i1 %cmp1.i67, label %listSum.exit70, label %while.body.i68

listSum.exit70:                                   ; preds = %while.body.i68, %while.end16.thread, %while.end16, %if.then.i63
  %43 = phi i32 [ %36, %while.end16 ], [ %36, %if.then.i63 ], [ undef, %while.end16.thread ], [ %36, %while.body.i68 ]
  %sum.1.i789396102 = phi i32 [ %sum.1.i789395, %while.end16 ], [ %sum.1.i789395, %if.then.i63 ], [ %add3.i, %while.end16.thread ], [ %sum.1.i789395, %while.body.i68 ]
  %sum.1.i69 = phi i32 [ 0, %while.end16 ], [ %36, %if.then.i63 ], [ 0, %while.end16.thread ], [ %add3.i65, %while.body.i68 ]
  %sub = sub i32 %sum.1.i789396102, %25
  %sub19 = add i32 %sub, %43
  %add = sub i32 %sub19, %sum.1.i69
  ret i32 %add
}

declare noalias i8* @malloc(i64) nounwind

define i32* @listAppend(i32* %p, i32 %n) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %p, null
  br i1 %cmp, label %if.end, label %while.cond

while.cond:                                       ; preds = %entry, %while.cond
  %x.0 = phi i32* [ %1, %while.cond ], [ %p, %entry ]
  %add.ptr = getelementptr inbounds i32* %x.0, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %1 = load i32** %0, align 8, !tbaa !3
  %cmp1 = icmp eq i32* %1, null
  br i1 %cmp1, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %call = tail call noalias i8* @malloc(i64 12) nounwind
  %2 = bitcast i8* %call to i32*
  store i32* %2, i32** %0, align 8, !tbaa !3
  store i32 %n, i32* %2, align 4, !tbaa !0
  %add.ptr4 = getelementptr inbounds i8* %call, i64 4
  %3 = bitcast i8* %add.ptr4 to i32**
  store i32* null, i32** %3, align 8, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %entry, %while.end
  ret i32* %p
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @listSum(i32* %p) nounwind uwtable readonly {
entry:
  %cmp = icmp eq i32* %p, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = load i32* %p, align 4, !tbaa !0
  %add.ptr4 = getelementptr inbounds i32* %p, i64 1
  %1 = bitcast i32* %add.ptr4 to i32**
  %2 = load i32** %1, align 8, !tbaa !3
  %cmp15 = icmp eq i32* %2, null
  br i1 %cmp15, label %if.end, label %while.body

while.body:                                       ; preds = %if.then, %while.body
  %3 = phi i32* [ %6, %while.body ], [ %2, %if.then ]
  %sum.06 = phi i32 [ %add3, %while.body ], [ %0, %if.then ]
  %4 = load i32* %3, align 4, !tbaa !0
  %add3 = add nsw i32 %4, %sum.06
  %add.ptr = getelementptr inbounds i32* %3, i64 1
  %5 = bitcast i32* %add.ptr to i32**
  %6 = load i32** %5, align 8, !tbaa !3
  %cmp1 = icmp eq i32* %6, null
  br i1 %cmp1, label %if.end, label %while.body

if.end:                                           ; preds = %if.then, %while.body, %entry
  %sum.1 = phi i32 [ 0, %entry ], [ %0, %if.then ], [ %add3, %while.body ]
  ret i32 %sum.1
}

define i32* @listReverse(i32* %p) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %p, null
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds i32* %p, i64 1
  %0 = bitcast i32* %add.ptr to i32**
  %1 = load i32** %0, align 8, !tbaa !3
  store i32* null, i32** %0, align 8, !tbaa !3
  %cmp25 = icmp eq i32* %1, null
  br i1 %cmp25, label %if.end, label %while.body

while.body:                                       ; preds = %if.then, %while.body
  %p.addr.07 = phi i32* [ %x.06, %while.body ], [ %p, %if.then ]
  %x.06 = phi i32* [ %3, %while.body ], [ %1, %if.then ]
  %add.ptr3 = getelementptr inbounds i32* %x.06, i64 1
  %2 = bitcast i32* %add.ptr3 to i32**
  %3 = load i32** %2, align 8, !tbaa !3
  store i32* %p.addr.07, i32** %2, align 8, !tbaa !3
  %cmp2 = icmp eq i32* %3, null
  br i1 %cmp2, label %if.end, label %while.body

if.end:                                           ; preds = %if.then, %while.body, %entry
  %p.addr.1 = phi i32* [ null, %entry ], [ %p, %if.then ], [ %x.06, %while.body ]
  ret i32* %p.addr.1
}

declare i32 @putchar(i32)

declare void @llvm.trap() nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
