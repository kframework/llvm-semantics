; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080519-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { %struct.du_chain*, i32, [4 x i8] }
%struct.du_chain = type { %struct.du_chain*, i32 }

@reg_class_contents = common global [2 x [2 x i64]] zeroinitializer, align 16
@main.du1 = internal unnamed_addr constant %0 { %struct.du_chain* null, i32 0, [4 x i8] undef }, align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @merge_overlapping_regs([2 x i64]* %p) nounwind uwtable noinline {
entry:
  %arrayidx = getelementptr inbounds [2 x i64]* %p, i64 0, i64 0
  %tmp1 = load i64* %arrayidx, align 8
  %cmp = icmp eq i64 %tmp1, -1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx3 = getelementptr inbounds [2 x i64]* %p, i64 0, i64 1
  %tmp4 = load i64* %arrayidx3, align 8
  %cmp5 = icmp eq i64 %tmp4, -1
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define void @regrename_optimize(%struct.du_chain* %this) nounwind uwtable noinline {
entry:
  %this_unavailable = alloca [2 x i64], align 16
  %arrayidx = getelementptr inbounds [2 x i64]* %this_unavailable, i64 0, i64 0
  store i64 0, i64* %arrayidx, align 16
  %arrayidx1 = getelementptr inbounds [2 x i64]* %this_unavailable, i64 0, i64 1
  store i64 0, i64* %arrayidx1, align 8
  %next_use2 = getelementptr inbounds %struct.du_chain* %this, i64 0, i32 0
  %tmp33 = load %struct.du_chain** %next_use2, align 8
  %tobool4 = icmp eq %struct.du_chain* %tmp33, null
  br i1 %tobool4, label %return, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %tmp18 = phi i64 [ %or19, %for.body ], [ 0, %entry ]
  %tmp12 = phi i64 [ %or, %for.body ], [ 0, %entry ]
  %next_use7 = phi %struct.du_chain** [ %next_use, %for.body ], [ %next_use2, %entry ]
  %storemerge6 = phi %struct.du_chain* [ %tmp22, %for.body ], [ %this, %entry ]
  %0 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %cl = getelementptr inbounds %struct.du_chain* %storemerge6, i64 0, i32 1
  %tmp5 = load i32* %cl, align 4
  %idxprom = sext i32 %tmp5 to i64
  %arraydecay = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom, i64 0
  %inc = add nsw i32 %0, 1
  %tmp10 = load i64* %arraydecay, align 16
  %neg = xor i64 %tmp10, -1
  %or = or i64 %tmp12, %neg
  store i64 %or, i64* %arrayidx, align 16
  %arrayidx14 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom, i64 1
  %tmp15 = load i64* %arrayidx14, align 8
  %neg16 = xor i64 %tmp15, -1
  %or19 = or i64 %tmp18, %neg16
  store i64 %or19, i64* %arrayidx1, align 8
  %tmp22 = load %struct.du_chain** %next_use7, align 8
  %next_use = getelementptr inbounds %struct.du_chain* %tmp22, i64 0, i32 0
  %tmp3 = load %struct.du_chain** %next_use, align 8
  %tobool = icmp eq %struct.du_chain* %tmp3, null
  br i1 %tobool, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %phitmp = icmp slt i32 %0, 0
  br i1 %phitmp, label %return, label %if.end

if.end:                                           ; preds = %for.end
  %cl25 = getelementptr inbounds %struct.du_chain* %tmp22, i64 0, i32 1
  %tmp26 = load i32* %cl25, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arraydecay29 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom27, i64 0
  %tmp32 = load i64* %arraydecay29, align 16
  %neg33 = xor i64 %tmp32, -1
  %or36 = or i64 %or, %neg33
  store i64 %or36, i64* %arrayidx, align 16
  %arrayidx38 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i64 0, i64 %idxprom27, i64 1
  %tmp39 = load i64* %arrayidx38, align 8
  %neg40 = xor i64 %tmp39, -1
  %or43 = or i64 %or19, %neg40
  store i64 %or43, i64* %arrayidx1, align 8
  call void @merge_overlapping_regs([2 x i64]* %this_unavailable)
  br label %return

return:                                           ; preds = %entry, %for.end, %if.end
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %du1 = alloca %struct.du_chain, align 8
  %du0 = alloca %struct.du_chain, align 8
  %tmp = bitcast %struct.du_chain* %du1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%0* @main.du1 to i8*), i64 16, i32 8, i1 false)
  %next_use = getelementptr inbounds %struct.du_chain* %du0, i64 0, i32 0
  store %struct.du_chain* %du1, %struct.du_chain** %next_use, align 8
  %cl = getelementptr inbounds %struct.du_chain* %du0, i64 0, i32 1
  store i32 1, i32* %cl, align 8
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 0, i64 0), align 16
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 0, i64 1), align 8
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 1, i64 0), align 16
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i64 0, i64 1, i64 1), align 8
  call void @regrename_optimize(%struct.du_chain* %du0)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
