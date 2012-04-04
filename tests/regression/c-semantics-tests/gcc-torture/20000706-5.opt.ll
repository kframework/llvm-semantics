; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000706-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.baz = type { i32, i32, i32 }

@c = common global %struct.baz* null, align 8

define void @bar(i32 %b) nounwind uwtable {
entry:
  %0 = load %struct.baz** @c, align 8, !tbaa !0
  %a = getelementptr inbounds %struct.baz* %0, i64 0, i32 0
  %1 = load i32* %a, align 4, !tbaa !3
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %b1 = getelementptr inbounds %struct.baz* %0, i64 0, i32 1
  %2 = load i32* %b1, align 4, !tbaa !3
  %cmp2 = icmp eq i32 %2, 2
  br i1 %cmp2, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.baz* %0, i64 0, i32 2
  %3 = load i32* %c, align 4, !tbaa !3
  %cmp4 = icmp eq i32 %3, 3
  %cmp6 = icmp eq i32 %b, 4
  %or.cond = and i1 %cmp4, %cmp6
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  ret void
}

declare void @abort() noreturn

define void @foo(i64 %a.coerce0, i32 %a.coerce1, i32 %b) nounwind uwtable {
entry:
  %a = alloca %struct.baz, align 8
  %coerce = alloca { i64, i32 }, align 8
  %0 = getelementptr { i64, i32 }* %coerce, i64 0, i32 0
  store i64 %a.coerce0, i64* %0, align 8
  %1 = getelementptr { i64, i32 }* %coerce, i64 0, i32 1
  store i32 %a.coerce1, i32* %1, align 8
  %2 = bitcast %struct.baz* %a to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  store %struct.baz* %a, %struct.baz** @c, align 8, !tbaa !0
  %4 = bitcast %struct.baz* %a to i64*
  %5 = load i64* %4, align 8
  %6 = icmp eq i64 %5, 8589934593
  br i1 %6, label %lor.lhs.false3.i, label %if.then.i

lor.lhs.false3.i:                                 ; preds = %entry
  %c.i = getelementptr inbounds %struct.baz* %a, i64 0, i32 2
  %7 = load i32* %c.i, align 8, !tbaa !3
  %cmp4.i = icmp eq i32 %7, 3
  %cmp6.i = icmp eq i32 %b, 4
  %or.cond.i = and i1 %cmp4.i, %cmp6.i
  br i1 %or.cond.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false3.i, %entry
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false3.i
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %a.i = alloca %struct.baz, align 8
  %coerce.i = alloca { i64, i32 }, align 8
  %0 = bitcast %struct.baz* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast { i64, i32 }* %coerce.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %2 = getelementptr { i64, i32 }* %coerce.i, i64 0, i32 0
  store i64 8589934593, i64* %2, align 8
  %3 = getelementptr { i64, i32 }* %coerce.i, i64 0, i32 1
  store i32 3, i32* %3, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 12, i32 8, i1 false) nounwind
  store %struct.baz* %a.i, %struct.baz** @c, align 8, !tbaa !0
  %4 = bitcast %struct.baz* %a.i to i64*
  %5 = load i64* %4, align 8
  %6 = icmp eq i64 %5, 8589934593
  br i1 %6, label %lor.lhs.false3.i.i, label %if.then.i.i

lor.lhs.false3.i.i:                               ; preds = %entry
  %c.i.i = getelementptr inbounds %struct.baz* %a.i, i64 0, i32 2
  %7 = load i32* %c.i.i, align 8, !tbaa !3
  %cmp4.i.i = icmp eq i32 %7, 3
  br i1 %cmp4.i.i, label %foo.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %lor.lhs.false3.i.i, %entry
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %lor.lhs.false3.i.i
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
