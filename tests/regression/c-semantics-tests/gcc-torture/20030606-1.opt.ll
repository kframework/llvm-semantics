; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030606-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32* @foo(i32* %x, i32 %b) nounwind uwtable {
entry:
  %incdec.ptr = getelementptr inbounds i32* %x, i64 1
  store i32 55, i32* %x, align 4, !tbaa !0
  %tobool = icmp eq i32 %b, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %incdec.ptr1 = getelementptr inbounds i32* %x, i64 2
  store i32 %b, i32* %incdec.ptr, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %x.addr.0 = phi i32* [ %incdec.ptr1, %if.then ], [ %incdec.ptr, %entry ]
  ret i32* %x.addr.0
}

define i32 @main() noreturn nounwind uwtable {
if.end24:
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
