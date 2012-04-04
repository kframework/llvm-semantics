; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050826-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtattr = type { i16, i16 }

define i32 @inet_check_attr(i8* nocapture %r, %struct.rtattr** nocapture %rta) nounwind uwtable noinline {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 15
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %1 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds %struct.rtattr** %rta, i64 %1
  %2 = load %struct.rtattr** %arrayidx, align 8, !tbaa !0
  %tobool = icmp eq %struct.rtattr* %2, null
  br i1 %tobool, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %rta_len = getelementptr inbounds %struct.rtattr* %2, i64 0, i32 0
  %3 = load i16* %rta_len, align 2, !tbaa !3
  %conv = zext i16 %3 to i64
  %sub1 = add i64 %conv, -4
  %cmp2 = icmp ult i64 %sub1, 4
  br i1 %cmp2, label %return, label %if.end

if.end:                                           ; preds = %if.then
  %4 = add i64 %indvars.iv, 4294967288
  %5 = trunc i64 %4 to i32
  %6 = icmp ugt i32 %5, 1
  br i1 %6, label %if.then9, label %for.inc

if.then9:                                         ; preds = %if.end
  %add.ptr = getelementptr inbounds %struct.rtattr* %2, i64 1
  store %struct.rtattr* %add.ptr, %struct.rtattr** %arrayidx, align 8, !tbaa !0
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then9, %if.end
  %indvars.iv.next = add i64 %indvars.iv, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %if.then
  %retval.0 = phi i32 [ -22, %if.then ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  %rt82 = alloca [2 x i32], align 4
  %rt82.sub = getelementptr inbounds [2 x i32]* %rt82, i64 0, i64 0
  %tmpcast = bitcast [2 x i32]* %rt82 to [2 x %struct.rtattr]*
  %rta = alloca [14 x %struct.rtattr*], align 16
  %arrayidx = bitcast [2 x i32]* %rt82 to %struct.rtattr*
  %rta_len = bitcast [2 x i32]* %rt82 to i16*
  store i16 12, i16* %rta_len, align 4, !tbaa !3
  %rta_type = getelementptr inbounds [2 x %struct.rtattr]* %tmpcast, i64 0, i64 0, i32 1
  store i16 0, i16* %rta_type, align 2, !tbaa !3
  %arrayidx2 = getelementptr inbounds [2 x i32]* %rt82, i64 0, i64 1
  %0 = load i32* %rt82.sub, align 4
  store i32 %0, i32* %arrayidx2, align 4
  %arrayidx5 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5, align 16, !tbaa !0
  %arrayidx5.1 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 1
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.1, align 8, !tbaa !0
  %arrayidx5.2 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 2
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.2, align 16, !tbaa !0
  %arrayidx5.3 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 3
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.3, align 8, !tbaa !0
  %arrayidx5.4 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 4
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.4, align 16, !tbaa !0
  %arrayidx5.5 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 5
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.5, align 8, !tbaa !0
  %arrayidx5.6 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 6
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.6, align 16, !tbaa !0
  %arrayidx5.7 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 7
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.7, align 8, !tbaa !0
  %arrayidx5.8 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 8
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.8, align 16, !tbaa !0
  %arrayidx5.9 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 9
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.9, align 8, !tbaa !0
  %arrayidx5.10 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 10
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.10, align 16, !tbaa !0
  %arrayidx5.11 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 11
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.11, align 8, !tbaa !0
  %arrayidx5.12 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 12
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.12, align 16, !tbaa !0
  %arrayidx5.13 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 13
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.13, align 8, !tbaa !0
  %1 = bitcast i32* %arrayidx2 to %struct.rtattr*
  %call = call i32 @inet_check_attr(i8* undef, %struct.rtattr** %arrayidx5)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %for.cond7, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

for.cond7:                                        ; preds = %entry, %for.body9
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.body9 ], [ 0, %entry ]
  %2 = trunc i64 %indvars.iv91 to i32
  %cmp8 = icmp slt i32 %2, 14
  br i1 %cmp8, label %for.body9, label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond7
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.2, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.3, align 8, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.4, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.6, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.7, align 8, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.8, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.9, align 8, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.10, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.11, align 8, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.12, align 16, !tbaa !0
  store %struct.rtattr* %arrayidx, %struct.rtattr** %arrayidx5.13, align 8, !tbaa !0
  store %struct.rtattr* null, %struct.rtattr** %arrayidx5.1, align 8, !tbaa !0
  %rta_len33 = bitcast i32* %arrayidx2 to i16*
  %3 = load i16* %rta_len33, align 4, !tbaa !3
  %sub = add i16 %3, -8
  store i16 %sub, i16* %rta_len33, align 4, !tbaa !3
  store %struct.rtattr* %1, %struct.rtattr** %arrayidx5.5, align 8, !tbaa !0
  %call38 = call i32 @inet_check_attr(i8* undef, %struct.rtattr** %arrayidx5)
  %cmp39 = icmp eq i32 %call38, -22
  br i1 %cmp39, label %for.cond43, label %if.then41

for.body9:                                        ; preds = %for.cond7
  %arrayidx11 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 %indvars.iv91
  %4 = load %struct.rtattr** %arrayidx11, align 8, !tbaa !0
  %5 = add i64 %indvars.iv91, 4294967289
  %6 = trunc i64 %5 to i32
  %7 = icmp ugt i32 %6, 1
  %idxprom14 = zext i1 %7 to i64
  %arrayidx15 = getelementptr inbounds [2 x %struct.rtattr]* %tmpcast, i64 0, i64 %idxprom14
  %cmp16 = icmp eq %struct.rtattr* %4, %arrayidx15
  %indvars.iv.next92 = add i64 %indvars.iv91, 1
  br i1 %cmp16, label %for.cond7, label %if.then17

if.then17:                                        ; preds = %for.body9
  call void @abort() noreturn nounwind
  unreachable

if.then41:                                        ; preds = %for.cond22.preheader
  call void @abort() noreturn nounwind
  unreachable

for.cond43:                                       ; preds = %for.cond22.preheader, %for.inc79
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc79 ], [ 0, %for.cond22.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %cmp44 = icmp slt i32 %8, 14
  br i1 %cmp44, label %for.body46, label %for.end81

for.body46:                                       ; preds = %for.cond43
  %cmp47 = icmp eq i32 %8, 1
  br i1 %cmp47, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body46
  %arrayidx50 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 %indvars.iv
  %9 = load %struct.rtattr** %arrayidx50, align 8, !tbaa !0
  %cmp51 = icmp eq %struct.rtattr* %9, null
  br i1 %cmp51, label %for.inc79, label %if.then53

if.then53:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %for.body46
  %cmp57 = icmp slt i32 %8, 6
  br i1 %cmp57, label %land.lhs.true59, label %land.lhs.true69

land.lhs.true59:                                  ; preds = %if.else
  %arrayidx61 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 %indvars.iv
  %10 = load %struct.rtattr** %arrayidx61, align 8, !tbaa !0
  %cmp63 = icmp eq %struct.rtattr* %10, %1
  br i1 %cmp63, label %if.else66, label %if.then65

if.then65:                                        ; preds = %land.lhs.true59
  call void @abort() noreturn nounwind
  unreachable

if.else66:                                        ; preds = %land.lhs.true59
  %cmp67 = icmp sgt i32 %8, 5
  br i1 %cmp67, label %land.lhs.true69, label %for.inc79

land.lhs.true69:                                  ; preds = %if.else, %if.else66
  %arrayidx71 = getelementptr inbounds [14 x %struct.rtattr*]* %rta, i64 0, i64 %indvars.iv
  %11 = load %struct.rtattr** %arrayidx71, align 8, !tbaa !0
  %cmp73 = icmp eq %struct.rtattr* %11, %arrayidx
  br i1 %cmp73, label %for.inc79, label %if.then75

if.then75:                                        ; preds = %land.lhs.true69
  call void @abort() noreturn nounwind
  unreachable

for.inc79:                                        ; preds = %land.lhs.true, %land.lhs.true69, %if.else66
  %indvars.iv.next = add i64 %indvars.iv, 1
  br label %for.cond43

for.end81:                                        ; preds = %for.cond43
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
