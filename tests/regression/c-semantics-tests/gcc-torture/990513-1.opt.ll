; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990513-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %BM_tab, i32 %j) nounwind uwtable {
while.body.lr.ph:
  %add.ptr = getelementptr inbounds i32* %BM_tab, i64 256
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %BM_tab.addr.05 = phi i32* [ %add.ptr, %while.body.lr.ph ], [ %incdec.ptr3, %while.body ]
  %incdec.ptr = getelementptr inbounds i32* %BM_tab.addr.05, i64 -1
  store i32 %j, i32* %incdec.ptr, align 4, !tbaa !0
  %incdec.ptr1 = getelementptr inbounds i32* %BM_tab.addr.05, i64 -2
  store i32 %j, i32* %incdec.ptr1, align 4, !tbaa !0
  %incdec.ptr2 = getelementptr inbounds i32* %BM_tab.addr.05, i64 -3
  store i32 %j, i32* %incdec.ptr2, align 4, !tbaa !0
  %incdec.ptr3 = getelementptr inbounds i32* %BM_tab.addr.05, i64 -4
  store i32 %j, i32* %incdec.ptr3, align 4, !tbaa !0
  %cmp = icmp eq i32* %incdec.ptr3, %BM_tab
  br i1 %cmp, label %while.end, label %while.body

while.end:                                        ; preds = %while.body
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %BM_tab = alloca [256 x i32], align 16
  %arraydecay = getelementptr inbounds [256 x i32]* %BM_tab, i64 0, i64 0
  %0 = bitcast [256 x i32]* %BM_tab to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 1024, i32 16, i1 false)
  %add.ptr.i = getelementptr inbounds [256 x i32]* %BM_tab, i64 0, i64 256
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %entry
  %BM_tab.addr.05.i = phi i32* [ %add.ptr.i, %entry ], [ %incdec.ptr3.i, %while.body.i ]
  %incdec.ptr.i = getelementptr inbounds i32* %BM_tab.addr.05.i, i64 -1
  store i32 6, i32* %incdec.ptr.i, align 4, !tbaa !0
  %incdec.ptr1.i = getelementptr inbounds i32* %BM_tab.addr.05.i, i64 -2
  store i32 6, i32* %incdec.ptr1.i, align 4, !tbaa !0
  %incdec.ptr2.i = getelementptr inbounds i32* %BM_tab.addr.05.i, i64 -3
  store i32 6, i32* %incdec.ptr2.i, align 4, !tbaa !0
  %incdec.ptr3.i = getelementptr inbounds i32* %BM_tab.addr.05.i, i64 -4
  store i32 6, i32* %incdec.ptr3.i, align 4, !tbaa !0
  %cmp.i = icmp eq i32* %incdec.ptr3.i, %arraydecay
  br i1 %cmp.i, label %foo.exit, label %while.body.i

foo.exit:                                         ; preds = %while.body.i
  %1 = load i32* %arraydecay, align 16, !tbaa !0
  %cmp = icmp eq i32 %1, 6
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %foo.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo.exit
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
