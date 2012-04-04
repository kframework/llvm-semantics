; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000403-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@aa = global [1 x i64] [i64 9223372036854771713], align 8
@bb = global [1 x i64] [i64 9223372036854771713], align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* getelementptr inbounds ([1 x i64]* @aa, i64 0, i64 0), align 8, !tbaa !0
  %1 = load i64* getelementptr inbounds ([1 x i64]* @bb, i64 0, i64 0), align 8, !tbaa !0
  %add.i = add i64 %0, 4096
  %sub.i = sub i64 %add.i, %1
  %cmp.i = icmp sgt i64 %sub.i, 0
  br i1 %cmp.i, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @seqgt(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable readnone {
entry:
  %conv = zext i16 %win to i64
  %add = sub i64 %a, %b
  %sub = add i64 %add, %conv
  %cmp = icmp sgt i64 %sub, 0
  %conv1 = zext i1 %cmp to i32
  ret i32 %conv1
}

define i32 @seqgt2(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable readnone {
entry:
  %conv = zext i16 %win to i64
  %add = sub i64 %a, %b
  %sub = add i64 %add, %conv
  %cmp = icmp sgt i64 %sub, 0
  %conv1 = zext i1 %cmp to i32
  ret i32 %conv1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
