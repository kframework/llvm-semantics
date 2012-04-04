; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080519-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.du_chain = type { %struct.du_chain*, i32 }

@reg_class_contents = common global [2 x [2 x i64]] zeroinitializer, align 16
@main.du1 = private unnamed_addr constant { %struct.du_chain*, i32, [4 x i8] } { %struct.du_chain* null, i32 0, [4 x i8] undef }, align 8

define void @merge_overlapping_regs([2 x i64]* nocapture %p) nounwind uwtable noinline {
entry:
  %arrayidx = getelementptr inbounds [2 x i64]* %p, i64 0, i64 0
  %0 = load i64* %arrayidx, align 8, !tbaa !0
  %cmp = icmp eq i64 %0, -1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [2 x i64]* %p, i64 0, i64 1
  %1 = load i64* %arrayidx1, align 8, !tbaa !0
  %cmp2 = icmp eq i64 %1, -1
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define void @regrename_optimize(%struct.du_chain* nocapture %this) nounwind uwtable noinline {
entry:
  %this_unavailable = alloca [2 x i64], align 16
  %arrayidx = getelementptr inbounds [2 x i64]* %this_unavailable, i64 0, i64 0
  %arrayidx1 = getelementptr inbounds [2 x i64]* %this_unavailable, i64 0, i64 1
  %next_use22 = getelementptr inbounds %struct.du_chain* %this, i64 0, i32 0
  %0 = bitcast [2 x i64]* %this_unavailable to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 16, i1 false)
  %1 = load %struct.du_chain** %next_use22, align 8, !tbaa !3
  %tobool23 = icmp eq %struct.du_chain* %1, null
  br i1 %tobool23, label %return, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %2 = phi %struct.du_chain* [ %8, %for.body ], [ %1, %entry ]
  %3 = phi i64 [ %or8, %for.body ], [ 0, %entry ]
  %4 = phi i64 [ %or, %for.body ], [ 0, %entry ]
  %last.025 = phi %struct.du_chain* [ %2, %for.body ], [ %this, %entry ]
  %n_uses.024 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %cl = getelementptr inbounds %struct.du_chain* %last.025, i64 0, i32 1
  %5 = load i32* %cl, align 4, !tbaa !4
  %idxprom = sext i32 %5 to i64
  %arraydecay = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom, i64 0
  %inc = add nsw i32 %n_uses.024, 1
  %6 = load i64* %arraydecay, align 16, !tbaa !0
  %neg = xor i64 %6, -1
  %or = or i64 %4, %neg
  %arrayidx5 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom, i64 1
  %7 = load i64* %arrayidx5, align 8, !tbaa !0
  %neg6 = xor i64 %7, -1
  %or8 = or i64 %3, %neg6
  %next_use = getelementptr inbounds %struct.du_chain* %2, i64 0, i32 0
  %8 = load %struct.du_chain** %next_use, align 8, !tbaa !3
  %tobool = icmp eq %struct.du_chain* %8, null
  br i1 %tobool, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  store i64 %or8, i64* %arrayidx1, align 8
  store i64 %or, i64* %arrayidx, align 16
  %phitmp = icmp slt i32 %n_uses.024, 0
  br i1 %phitmp, label %return, label %if.end

if.end:                                           ; preds = %for.end
  %cl10 = getelementptr inbounds %struct.du_chain* %2, i64 0, i32 1
  %9 = load i32* %cl10, align 4, !tbaa !4
  %idxprom11 = sext i32 %9 to i64
  %arraydecay13 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom11, i64 0
  %10 = load i64* %arraydecay13, align 16, !tbaa !0
  %neg15 = xor i64 %10, -1
  %or17 = or i64 %or, %neg15
  store i64 %or17, i64* %arrayidx, align 16, !tbaa !0
  %arrayidx18 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom11, i64 1
  %11 = load i64* %arrayidx18, align 8, !tbaa !0
  %neg19 = xor i64 %11, -1
  %or21 = or i64 %or8, %neg19
  store i64 %or21, i64* %arrayidx1, align 8, !tbaa !0
  call void @merge_overlapping_regs([2 x i64]* %this_unavailable)
  br label %return

return:                                           ; preds = %entry, %for.end, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %du1 = alloca %struct.du_chain, align 8
  %du0 = alloca %struct.du_chain, align 8
  %0 = bitcast %struct.du_chain* %du1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ({ %struct.du_chain*, i32, [4 x i8] }* @main.du1 to i8*), i64 16, i32 8, i1 false)
  %next_use = getelementptr inbounds %struct.du_chain* %du0, i64 0, i32 0
  store %struct.du_chain* %du1, %struct.du_chain** %next_use, align 8, !tbaa !3
  %cl = getelementptr inbounds %struct.du_chain* %du0, i64 0, i32 1
  store i32 1, i32* %cl, align 8, !tbaa !4
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 0, i64 0), align 16, !tbaa !0
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 0, i64 1), align 8, !tbaa !0
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 1, i64 0), align 16, !tbaa !0
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 1, i64 1), align 8, !tbaa !0
  call void @regrename_optimize(%struct.du_chain* %du0)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
!4 = metadata !{metadata !"int", metadata !1}
