; ModuleID = '/home/david/src/c-semantics/tests/integration/fib.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %a.i = alloca [3 x i32], align 4
  %0 = bitcast [3 x i32]* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arraydecay.i = getelementptr inbounds [3 x i32]* %a.i, i64 0, i64 0
  %add.ptr25.i = getelementptr inbounds [3 x i32]* %a.i, i64 0, i64 2
  %add.ptr.i = getelementptr inbounds [3 x i32]* %a.i, i64 0, i64 1
  br label %for.body.i

for.body.i:                                       ; preds = %if.end23.i, %entry
  %i.035.i = phi i32 [ 0, %entry ], [ %inc.i, %if.end23.i ]
  %p.034.i = phi i32* [ %arraydecay.i, %entry ], [ %arraydecay.incdec.ptr.i, %if.end23.i ]
  %cmp1.i = icmp ult i32 %i.035.i, 2
  br i1 %cmp1.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body.i
  store i32 %i.035.i, i32* %p.034.i, align 4, !tbaa !0
  br label %if.end23.i

if.else.i:                                        ; preds = %for.body.i
  %cmp3.i = icmp eq i32* %p.034.i, %arraydecay.i
  br i1 %cmp3.i, label %if.then4.i, label %if.else8.i

if.then4.i:                                       ; preds = %if.else.i
  %1 = load i32* %add.ptr.i, align 4, !tbaa !0
  %2 = load i32* %add.ptr25.i, align 4, !tbaa !0
  %add.i = add i32 %2, %1
  store i32 %add.i, i32* %arraydecay.i, align 4, !tbaa !0
  br label %if.end23.i

if.else8.i:                                       ; preds = %if.else.i
  %cmp11.i = icmp eq i32* %p.034.i, %add.ptr.i
  %3 = load i32* %arraydecay.i, align 4, !tbaa !0
  br i1 %cmp11.i, label %if.then12.i, label %if.else17.i

if.then12.i:                                      ; preds = %if.else8.i
  %4 = load i32* %add.ptr25.i, align 4, !tbaa !0
  %add16.i = add i32 %4, %3
  store i32 %add16.i, i32* %add.ptr.i, align 4, !tbaa !0
  br label %if.end23.i

if.else17.i:                                      ; preds = %if.else8.i
  %5 = load i32* %add.ptr.i, align 4, !tbaa !0
  %add21.i = add i32 %5, %3
  store i32 %add21.i, i32* %p.034.i, align 4, !tbaa !0
  br label %if.end23.i

if.end23.i:                                       ; preds = %if.else17.i, %if.then12.i, %if.then4.i, %if.then.i
  %incdec.ptr.i = getelementptr inbounds i32* %p.034.i, i64 1
  %cmp26.i = icmp ugt i32* %incdec.ptr.i, %add.ptr25.i
  %arraydecay.incdec.ptr.i = select i1 %cmp26.i, i32* %arraydecay.i, i32* %incdec.ptr.i
  %inc.i = add i32 %i.035.i, 1
  %exitcond = icmp eq i32 %inc.i, 11
  br i1 %exitcond, label %fastfib.exit, label %for.body.i

fastfib.exit:                                     ; preds = %if.end23.i
  %call = call i32 @fib(i32 10)
  %cmp31.i = icmp eq i32* %arraydecay.incdec.ptr.i, %arraydecay.i
  %add.ptr32.i = getelementptr inbounds i32* %arraydecay.incdec.ptr.i, i64 2
  %add.ptr33.i = getelementptr inbounds i32* %arraydecay.incdec.ptr.i, i64 -1
  %cond.in.i = select i1 %cmp31.i, i32* %add.ptr32.i, i32* %add.ptr33.i
  %cond.i = load i32* %cond.in.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %add2 = add i32 %cond.i, %call
  %add4 = add i32 %add2, 55
  ret i32 %add4
}

define i32 @fib(i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i32 %n, 2
  br i1 %cmp, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %sub = add i32 %n, -1
  %call = tail call i32 @fib(i32 %sub)
  %sub1 = add i32 %n, -2
  %call2 = tail call i32 @fib(i32 %sub1)
  %add = add i32 %call2, %call
  ret i32 %add

cond.end:                                         ; preds = %entry
  ret i32 %n
}

define i32 @fastfib(i32 %n) nounwind uwtable {
entry:
  %a = alloca [3 x i32], align 4
  %arraydecay = getelementptr inbounds [3 x i32]* %a, i64 0, i64 0
  %add.ptr25 = getelementptr inbounds [3 x i32]* %a, i64 0, i64 2
  %add.ptr = getelementptr inbounds [3 x i32]* %a, i64 0, i64 1
  br label %for.body

for.body:                                         ; preds = %entry, %if.end23
  %i.035 = phi i32 [ 0, %entry ], [ %inc, %if.end23 ]
  %p.034 = phi i32* [ %arraydecay, %entry ], [ %arraydecay.incdec.ptr, %if.end23 ]
  %cmp1 = icmp ult i32 %i.035, 2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 %i.035, i32* %p.034, align 4, !tbaa !0
  br label %if.end23

if.else:                                          ; preds = %for.body
  %cmp3 = icmp eq i32* %p.034, %arraydecay
  br i1 %cmp3, label %if.then4, label %if.else8

if.then4:                                         ; preds = %if.else
  %0 = load i32* %add.ptr, align 4, !tbaa !0
  %1 = load i32* %add.ptr25, align 4, !tbaa !0
  %add = add i32 %1, %0
  store i32 %add, i32* %arraydecay, align 4, !tbaa !0
  br label %if.end23

if.else8:                                         ; preds = %if.else
  %cmp11 = icmp eq i32* %p.034, %add.ptr
  %2 = load i32* %arraydecay, align 4, !tbaa !0
  br i1 %cmp11, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.else8
  %3 = load i32* %add.ptr25, align 4, !tbaa !0
  %add16 = add i32 %3, %2
  store i32 %add16, i32* %add.ptr, align 4, !tbaa !0
  br label %if.end23

if.else17:                                        ; preds = %if.else8
  %4 = load i32* %add.ptr, align 4, !tbaa !0
  %add21 = add i32 %4, %2
  store i32 %add21, i32* %p.034, align 4, !tbaa !0
  br label %if.end23

if.end23:                                         ; preds = %if.then4, %if.else17, %if.then12, %if.then
  %incdec.ptr = getelementptr inbounds i32* %p.034, i64 1
  %cmp26 = icmp ugt i32* %incdec.ptr, %add.ptr25
  %arraydecay.incdec.ptr = select i1 %cmp26, i32* %arraydecay, i32* %incdec.ptr
  %inc = add i32 %i.035, 1
  %cmp = icmp ugt i32 %inc, %n
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %if.end23
  %cmp31 = icmp eq i32* %arraydecay.incdec.ptr, %arraydecay
  %add.ptr32 = getelementptr inbounds i32* %arraydecay.incdec.ptr, i64 2
  %add.ptr33 = getelementptr inbounds i32* %arraydecay.incdec.ptr, i64 -1
  %cond.in = select i1 %cmp31, i32* %add.ptr32, i32* %add.ptr33
  %cond = load i32* %cond.in, align 4
  ret i32 %cond
}

define i32 @fastfib_v2(i32 %n) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %n, 0
  br i1 %cmp, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %sub = add i32 %n, -1
  %cmp12 = icmp eq i32 %sub, 0
  br i1 %cmp12, label %return, label %for.body

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %i.05 = phi i32 [ %inc, %for.body ], [ 0, %for.cond.preheader ]
  %n0.04 = phi i32 [ %n1.03, %for.body ], [ 0, %for.cond.preheader ]
  %n1.03 = phi i32 [ %add, %for.body ], [ 1, %for.cond.preheader ]
  %add = add i32 %n0.04, %n1.03
  %inc = add i32 %i.05, 1
  %exitcond = icmp eq i32 %inc, %sub
  br i1 %exitcond, label %return, label %for.body

return:                                           ; preds = %for.cond.preheader, %for.body, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 1, %for.cond.preheader ], [ %add, %for.body ]
  ret i32 %retval.0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
