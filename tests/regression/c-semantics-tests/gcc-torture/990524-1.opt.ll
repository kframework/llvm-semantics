; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990524-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [6 x i8] c"12345\00", align 1
@b = global [6 x i8] c"12345\00", align 1

define void @loop(i8* %pz, i8* %pzDta) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %sw.bb2, %entry
  %pzDta.addr.0 = phi i8* [ %pzDta, %entry ], [ %incdec.ptr, %sw.bb2 ], [ %incdec.ptr, %for.cond ]
  %pz.addr.0 = phi i8* [ %pz, %entry ], [ %incdec.ptr4, %sw.bb2 ], [ %incdec.ptr1, %for.cond ]
  %incdec.ptr = getelementptr inbounds i8* %pzDta.addr.0, i64 1
  %0 = load i8* %pzDta.addr.0, align 1, !tbaa !0
  %incdec.ptr1 = getelementptr inbounds i8* %pz.addr.0, i64 1
  store i8 %0, i8* %pz.addr.0, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  switch i32 %conv, label %for.cond [
    i32 0, label %loopDone2
    i32 34, label %sw.bb2
    i32 92, label %sw.bb2
  ]

sw.bb2:                                           ; preds = %for.cond, %for.cond
  store i8 92, i8* %pz.addr.0, align 1, !tbaa !0
  %1 = load i8* %pzDta.addr.0, align 1, !tbaa !0
  %incdec.ptr4 = getelementptr inbounds i8* %pz.addr.0, i64 2
  store i8 %1, i8* %incdec.ptr1, align 1, !tbaa !0
  br label %for.cond

loopDone2:                                        ; preds = %for.cond
  %sub.ptr.rhs.cast = ptrtoint i8* %incdec.ptr1 to i64
  %sub.ptr.sub = sub i64 ptrtoint ([6 x i8]* @a to i64), %sub.ptr.rhs.cast
  %sub.ptr.rhs.cast5 = ptrtoint i8* %incdec.ptr to i64
  %sub.ptr.sub6 = sub i64 ptrtoint ([6 x i8]* @b to i64), %sub.ptr.rhs.cast5
  %cmp = icmp eq i64 %sub.ptr.sub, %sub.ptr.sub6
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %loopDone2
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %loopDone2
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %sw.bb2.i, %for.cond.i, %entry
  %pzDta.addr.0.i = phi i8* [ getelementptr inbounds ([6 x i8]* @b, i64 0, i64 0), %entry ], [ %incdec.ptr.i, %for.cond.i ], [ %incdec.ptr.i, %sw.bb2.i ]
  %pz.addr.0.i = phi i8* [ getelementptr inbounds ([6 x i8]* @a, i64 0, i64 0), %entry ], [ %incdec.ptr1.i, %for.cond.i ], [ %incdec.ptr4.i, %sw.bb2.i ]
  %incdec.ptr.i = getelementptr inbounds i8* %pzDta.addr.0.i, i64 1
  %0 = load i8* %pzDta.addr.0.i, align 1, !tbaa !0
  %incdec.ptr1.i = getelementptr inbounds i8* %pz.addr.0.i, i64 1
  store i8 %0, i8* %pz.addr.0.i, align 1, !tbaa !0
  %conv.i = sext i8 %0 to i32
  switch i32 %conv.i, label %for.cond.i [
    i32 0, label %loopDone2.i
    i32 34, label %sw.bb2.i
    i32 92, label %sw.bb2.i
  ]

sw.bb2.i:                                         ; preds = %for.cond.i, %for.cond.i
  store i8 92, i8* %pz.addr.0.i, align 1, !tbaa !0
  %1 = load i8* %pzDta.addr.0.i, align 1, !tbaa !0
  %incdec.ptr4.i = getelementptr inbounds i8* %pz.addr.0.i, i64 2
  store i8 %1, i8* %incdec.ptr1.i, align 1, !tbaa !0
  br label %for.cond.i

loopDone2.i:                                      ; preds = %for.cond.i
  %sub.ptr.rhs.cast.i = ptrtoint i8* %incdec.ptr1.i to i64
  %sub.ptr.sub.i = sub i64 ptrtoint ([6 x i8]* @a to i64), %sub.ptr.rhs.cast.i
  %sub.ptr.rhs.cast5.i = ptrtoint i8* %incdec.ptr.i to i64
  %sub.ptr.sub6.i = sub i64 ptrtoint ([6 x i8]* @b to i64), %sub.ptr.rhs.cast5.i
  %cmp.i = icmp eq i64 %sub.ptr.sub.i, %sub.ptr.sub6.i
  br i1 %cmp.i, label %loop.exit, label %if.then.i

if.then.i:                                        ; preds = %loopDone2.i
  tail call void @abort() noreturn nounwind
  unreachable

loop.exit:                                        ; preds = %loopDone2.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
