; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010910-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.epic_private = type { %struct.epic_rx_desc*, [5 x i32] }
%struct.epic_rx_desc = type { i32 }

@check_rx_ring = internal unnamed_addr constant [5 x i32] [i32 12, i32 14, i32 16, i32 18, i32 10], align 16

define i32 @main() nounwind uwtable {
entry:
  %ep = alloca %struct.epic_private, align 8
  %rx_ring = alloca [5 x %struct.epic_rx_desc], align 16
  %rx_ring25 = bitcast [5 x %struct.epic_rx_desc]* %rx_ring to i8*
  call void @llvm.memset.p0i8.i64(i8* %rx_ring25, i8 0, i64 16, i32 16, i1 false)
  %arrayidx2 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 1, i64 0
  %arrayidx2.1 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 1, i64 1
  %arrayidx2.2 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 1, i64 2
  %arrayidx2.3 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 1, i64 3
  %arrayidx2.4 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 1, i64 4
  %arraydecay = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 0
  %rx_ring3 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 0
  store %struct.epic_rx_desc* %arraydecay, %struct.epic_rx_desc** %rx_ring3, align 8, !tbaa !0
  %next.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 0, i32 0
  store i32 12, i32* %next.i, align 16, !tbaa !3
  store i32 0, i32* %arrayidx2, align 8, !tbaa !3
  %next.1.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 1, i32 0
  store i32 14, i32* %next.1.i, align 4, !tbaa !3
  store i32 0, i32* %arrayidx2.1, align 4, !tbaa !3
  %next.2.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 2, i32 0
  store i32 16, i32* %next.2.i, align 8, !tbaa !3
  store i32 0, i32* %arrayidx2.2, align 8, !tbaa !3
  %next.3.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 3, i32 0
  store i32 18, i32* %next.3.i, align 4, !tbaa !3
  store i32 0, i32* %arrayidx2.3, align 4, !tbaa !3
  %next.4.i = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 4, i32 0
  store i32 0, i32* %arrayidx2.4, align 8, !tbaa !3
  store i32 10, i32* %next.4.i, align 16, !tbaa !3
  br label %for.cond4

for.cond4:                                        ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp5 = icmp slt i32 %0, 5
  br i1 %cmp5, label %for.body6, label %for.end21

for.body6:                                        ; preds = %for.cond4
  %next9 = getelementptr inbounds [5 x %struct.epic_rx_desc]* %rx_ring, i64 0, i64 %indvars.iv, i32 0
  %1 = load i32* %next9, align 4, !tbaa !3
  %arrayidx11 = getelementptr inbounds [5 x i32]* @check_rx_ring, i64 0, i64 %indvars.iv
  %2 = load i32* %arrayidx11, align 4, !tbaa !3
  %cmp12 = icmp eq i32 %1, %2
  br i1 %cmp12, label %if.end, label %if.then

if.then:                                          ; preds = %for.body6
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body6
  %arrayidx15 = getelementptr inbounds %struct.epic_private* %ep, i64 0, i32 1, i64 %indvars.iv
  %3 = load i32* %arrayidx15, align 4, !tbaa !3
  %cmp16 = icmp eq i32 %3, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp16, label %for.cond4, label %if.then17

if.then17:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

for.end21:                                        ; preds = %for.cond4
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
