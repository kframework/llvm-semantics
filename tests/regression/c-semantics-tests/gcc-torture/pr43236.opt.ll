; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43236.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %A = alloca [30 x i8], align 16
  %B = alloca [30 x i8], align 16
  %C = alloca [30 x i8], align 16
  %arraydecay = getelementptr inbounds [30 x i8]* %A, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 1, i64 30, i32 16, i1 false)
  %arraydecay1 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay1, i8 1, i64 30, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [30 x i8]* %A, i64 0, i64 19
  store i8 0, i8* %arrayidx, align 1, !tbaa !0
  %arrayidx3 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 19
  store i8 0, i8* %arrayidx3, align 1, !tbaa !0
  %arrayidx.1 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 18
  store i8 0, i8* %arrayidx.1, align 2, !tbaa !0
  %arrayidx3.1 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 18
  store i8 0, i8* %arrayidx3.1, align 2, !tbaa !0
  %arrayidx.2 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 17
  store i8 0, i8* %arrayidx.2, align 1, !tbaa !0
  %arrayidx3.2 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 17
  store i8 0, i8* %arrayidx3.2, align 1, !tbaa !0
  %arrayidx.3 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 16
  store i8 0, i8* %arrayidx.3, align 16, !tbaa !0
  %arrayidx3.3 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 16
  store i8 0, i8* %arrayidx3.3, align 16, !tbaa !0
  %arrayidx.4 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 15
  store i8 0, i8* %arrayidx.4, align 1, !tbaa !0
  %arrayidx3.4 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 15
  store i8 0, i8* %arrayidx3.4, align 1, !tbaa !0
  %arrayidx.5 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 14
  store i8 0, i8* %arrayidx.5, align 2, !tbaa !0
  %arrayidx3.5 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 14
  store i8 0, i8* %arrayidx3.5, align 2, !tbaa !0
  %arrayidx.6 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 13
  store i8 0, i8* %arrayidx.6, align 1, !tbaa !0
  %arrayidx3.6 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 13
  store i8 0, i8* %arrayidx3.6, align 1, !tbaa !0
  %arrayidx.7 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 12
  store i8 0, i8* %arrayidx.7, align 4, !tbaa !0
  %arrayidx3.7 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 12
  store i8 0, i8* %arrayidx3.7, align 4, !tbaa !0
  %arrayidx.8 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 11
  store i8 0, i8* %arrayidx.8, align 1, !tbaa !0
  %arrayidx3.8 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 11
  store i8 0, i8* %arrayidx3.8, align 1, !tbaa !0
  %arrayidx.9 = getelementptr inbounds [30 x i8]* %A, i64 0, i64 10
  store i8 0, i8* %arrayidx.9, align 2, !tbaa !0
  %arrayidx3.9 = getelementptr inbounds [30 x i8]* %B, i64 0, i64 10
  store i8 0, i8* %arrayidx3.9, align 2, !tbaa !0
  %arraydecay4 = getelementptr inbounds [30 x i8]* %C, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay4, i8 1, i64 30, i32 16, i1 false)
  %add.ptr = getelementptr inbounds [30 x i8]* %C, i64 0, i64 10
  call void @llvm.memset.p0i8.i64(i8* %add.ptr, i8 0, i64 10, i32 2, i1 false)
  %call = call i32 @memcmp(i8* %arraydecay, i8* %arraydecay4, i64 30) nounwind
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %call10 = call i32 @memcmp(i8* %arraydecay1, i8* %arraydecay4, i64 30) nounwind
  %tobool11 = icmp eq i32 %call10, 0
  br i1 %tobool11, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare void @abort() noreturn

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
