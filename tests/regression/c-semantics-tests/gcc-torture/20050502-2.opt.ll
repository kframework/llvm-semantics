; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050502-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.x = private unnamed_addr constant [11 x i8] c"IJKLMNOPQR\00", align 1
@.str = private unnamed_addr constant [11 x i8] c"IJKL\00NOPQR\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"IJKLMNOP\00R\00", align 1

define void @foo(i8* nocapture %x) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i8* %x, i64 4
  store i8 0, i8* %arrayidx, align 1, !tbaa !0
  ret void
}

define void @bar(i8* nocapture %x) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i8* %x, i64 8
  store i8 0, i8* %arrayidx, align 1, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %x = alloca [11 x i8], align 1
  %0 = getelementptr inbounds [11 x i8]* %x, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([11 x i8]* @main.x, i64 0, i64 0), i64 11, i32 1, i1 false)
  %arrayidx.i = getelementptr inbounds [11 x i8]* %x, i64 0, i64 4
  store i8 0, i8* %arrayidx.i, align 1, !tbaa !0
  %call = call i32 @memcmp(i8* %0, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i64 11) nounwind
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i8 77, i8* %arrayidx.i, align 1, !tbaa !0
  %arrayidx.i8 = getelementptr inbounds [11 x i8]* %x, i64 0, i64 8
  store i8 0, i8* %arrayidx.i8, align 1, !tbaa !0
  %call4 = call i32 @memcmp(i8* %0, i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i64 11) nounwind
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
