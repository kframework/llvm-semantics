; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000801-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i8* %bp, i32 %n) nounwind uwtable {
entry:
  %idx.ext = zext i32 %n to i64
  %add.ptr = getelementptr inbounds i8* %bp, i64 %idx.ext
  %cmp5 = icmp eq i32 %n, 0
  br i1 %cmp5, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %bp.addr.06 = phi i8* [ %add.ptr4, %while.body ], [ %bp, %entry ]
  %add.ptr1 = getelementptr inbounds i8* %bp.addr.06, i64 3
  %0 = load i8* %add.ptr1, align 1, !tbaa !0
  %1 = load i8* %bp.addr.06, align 1, !tbaa !0
  store i8 %1, i8* %add.ptr1, align 1, !tbaa !0
  %incdec.ptr = getelementptr inbounds i8* %bp.addr.06, i64 1
  store i8 %0, i8* %bp.addr.06, align 1, !tbaa !0
  %add.ptr2 = getelementptr inbounds i8* %bp.addr.06, i64 2
  %2 = load i8* %add.ptr2, align 1, !tbaa !0
  %3 = load i8* %incdec.ptr, align 1, !tbaa !0
  store i8 %3, i8* %add.ptr2, align 1, !tbaa !0
  store i8 %2, i8* %incdec.ptr, align 1, !tbaa !0
  %add.ptr4 = getelementptr inbounds i8* %bp.addr.06, i64 4
  %cmp = icmp ult i8* %add.ptr4, %add.ptr
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %one = alloca i32, align 4
  %0 = bitcast i32* %one to i8*
  %incdec.ptr.i = getelementptr inbounds i8* %0, i64 1
  %add.ptr2.i = getelementptr inbounds i8* %0, i64 2
  store i32 0, i32* %one, align 4
  store i8 1, i8* %0, align 4, !tbaa !0
  store i8 0, i8* %add.ptr2.i, align 2, !tbaa !0
  store i8 0, i8* %incdec.ptr.i, align 1, !tbaa !0
  %1 = load i32* %one, align 4, !tbaa !2
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
