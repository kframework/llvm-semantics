; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071029-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.T = type { %struct.anon }
%struct.anon = type { i32, i32, i32, i32, i32, i32, i32, i32, i64, i64, i32 }

@test.i = internal unnamed_addr global i32 11, align 4

define void @test(%union.T* nocapture %t) nounwind uwtable noinline {
entry:
  %f1 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 0
  %0 = load i32* %f1, align 4, !tbaa !0
  %1 = load i32* @test.i, align 4, !tbaa !0
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @test.i, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %f23 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 1
  %2 = load i32* %f23, align 4, !tbaa !0
  %tobool = icmp eq i32 %2, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then33

lor.lhs.false:                                    ; preds = %if.end
  %f3 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 2
  %3 = load i32* %f3, align 4, !tbaa !0
  %tobool5 = icmp eq i32 %3, 0
  br i1 %tobool5, label %lor.lhs.false6, label %if.then33

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %f48 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 3
  %4 = load i32* %f48, align 4, !tbaa !0
  %tobool9 = icmp eq i32 %4, 0
  br i1 %tobool9, label %lor.lhs.false10, label %if.then33

lor.lhs.false10:                                  ; preds = %lor.lhs.false6
  %f5 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 4
  %5 = load i32* %f5, align 4, !tbaa !0
  %tobool12 = icmp eq i32 %5, 0
  br i1 %tobool12, label %lor.lhs.false13, label %if.then33

lor.lhs.false13:                                  ; preds = %lor.lhs.false10
  %f6 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 5
  %6 = load i32* %f6, align 4, !tbaa !0
  %tobool15 = icmp eq i32 %6, 0
  br i1 %tobool15, label %lor.lhs.false16, label %if.then33

lor.lhs.false16:                                  ; preds = %lor.lhs.false13
  %f718 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 6
  %7 = load i32* %f718, align 4, !tbaa !0
  %tobool19 = icmp eq i32 %7, 0
  br i1 %tobool19, label %lor.lhs.false20, label %if.then33

lor.lhs.false20:                                  ; preds = %lor.lhs.false16
  %f8 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 7
  %8 = load i32* %f8, align 4, !tbaa !0
  %tobool22 = icmp eq i32 %8, 0
  br i1 %tobool22, label %lor.lhs.false23, label %if.then33

lor.lhs.false23:                                  ; preds = %lor.lhs.false20
  %f9 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 8
  %9 = load i64* %f9, align 8, !tbaa !3
  %tobool25 = icmp eq i64 %9, 0
  br i1 %tobool25, label %lor.lhs.false26, label %if.then33

lor.lhs.false26:                                  ; preds = %lor.lhs.false23
  %f10 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 9
  %10 = load i64* %f10, align 8, !tbaa !3
  %tobool28 = icmp eq i64 %10, 0
  br i1 %tobool28, label %lor.lhs.false29, label %if.then33

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %f1131 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 10
  %11 = load i32* %f1131, align 4, !tbaa !0
  %tobool32 = icmp eq i32 %11, 0
  br i1 %tobool32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %lor.lhs.false29, %lor.lhs.false26, %lor.lhs.false23, %lor.lhs.false20, %lor.lhs.false16, %lor.lhs.false13, %lor.lhs.false10, %lor.lhs.false6, %lor.lhs.false, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %lor.lhs.false29
  %cmp35 = icmp eq i32 %inc, 20
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end34
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end34
  ret void
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define void @foo(i32 %i) noreturn nounwind uwtable noinline {
entry:
  %t = alloca %union.T, align 8
  %t1.0 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 0
  %t1.1 = getelementptr inbounds %union.T* %t, i64 0, i32 0, i32 1
  br label %again

again:                                            ; preds = %again, %entry
  %i.addr.0 = phi i32 [ %i, %entry ], [ %inc, %again ]
  %inc = add nsw i32 %i.addr.0, 1
  store i32 %inc, i32* %t1.0, align 8
  %0 = bitcast i32* %t1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 4, i1 false)
  call void @test(%union.T* %t)
  br label %again
}

define i32 @main() noreturn nounwind uwtable {
if.end9:
  call void @foo(i32 10)
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long", metadata !1}
