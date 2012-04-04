; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010518-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type <{ i16, i64, i16, i16, %struct.b_struct }>
%struct.b_struct = type <{ i8, i8, i8, i8, i8, i8 }>

define i32 @main() noreturn nounwind uwtable {
entry:
  %b = alloca %struct.a_struct, align 2
  %b.0 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 0
  store i16 1, i16* %b.0, align 2
  %b.1 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 1
  store i64 2, i64* %b.1, align 2
  %b.2 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 2
  store i16 3, i16* %b.2, align 2
  %b.3 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 3
  store i16 4, i16* %b.3, align 2
  %b.4.0 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 0
  %b.4.4 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 4
  call void @llvm.memset.p0i8.i64(i8* %b.4.0, i8 0, i64 6, i32 2, i1 false)
  store volatile i8 99, i8* %b.4.4, align 2, !tbaa !0
  %0 = load volatile i16* %b.0, align 2, !tbaa !2
  %cmp = icmp eq i16 %0, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load volatile i64* %b.1, align 2, !tbaa !3
  %cmp7 = icmp eq i64 %1, 2
  br i1 %cmp7, label %lor.lhs.false9, label %if.then

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %2 = load volatile i16* %b.2, align 2, !tbaa !2
  %cmp12 = icmp eq i16 %2, 3
  br i1 %cmp12, label %lor.lhs.false14, label %if.then

lor.lhs.false14:                                  ; preds = %lor.lhs.false9
  %3 = load volatile i16* %b.3, align 2, !tbaa !2
  %cmp17 = icmp eq i16 %3, 4
  br i1 %cmp17, label %lor.lhs.false19, label %if.then

lor.lhs.false19:                                  ; preds = %lor.lhs.false14
  %4 = load volatile i8* %b.4.4, align 2, !tbaa !0
  %cmp23 = icmp eq i8 %4, 99
  br i1 %cmp23, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false19, %lor.lhs.false14, %lor.lhs.false9, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false19
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"short", metadata !0}
!3 = metadata !{metadata !"long", metadata !0}
