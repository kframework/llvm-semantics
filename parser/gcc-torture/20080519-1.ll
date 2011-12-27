; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080519-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { %struct.du_chain*, i32, [4 x i8] }
%struct.du_chain = type { %struct.du_chain*, i32 }

@reg_class_contents = common global [2 x [2 x i64]] zeroinitializer, align 16
@main.du1 = internal unnamed_addr constant %0 { %struct.du_chain* null, i32 0, [4 x i8] undef }, align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @merge_overlapping_regs([2 x i64]* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca [2 x i64]*, align 8
  store [2 x i64]* %p, [2 x i64]** %p.addr, align 8
  %tmp = load [2 x i64]** %p.addr, align 8
  %arrayidx = getelementptr inbounds [2 x i64]* %tmp, i32 0, i64 0
  %tmp1 = load i64* %arrayidx
  %cmp = icmp ne i64 %tmp1, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load [2 x i64]** %p.addr, align 8
  %arrayidx3 = getelementptr inbounds [2 x i64]* %tmp2, i32 0, i64 1
  %tmp4 = load i64* %arrayidx3
  %cmp5 = icmp ne i64 %tmp4, -1
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define void @regrename_optimize(%struct.du_chain* %this) nounwind uwtable noinline {
entry:
  %this.addr = alloca %struct.du_chain*, align 8
  %this_unavailable = alloca [2 x i64], align 16
  %scan_fp_ = alloca i64*, align 8
  %n_uses = alloca i32, align 4
  %last = alloca %struct.du_chain*, align 8
  store %struct.du_chain* %this, %struct.du_chain** %this.addr, align 8
  %arrayidx = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  store i64 0, i64* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  store i64 0, i64* %arrayidx1, align 8
  store i32 0, i32* %n_uses, align 4
  %tmp = load %struct.du_chain** %this.addr, align 8
  store %struct.du_chain* %tmp, %struct.du_chain** %last, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load %struct.du_chain** %last, align 8
  %next_use = getelementptr inbounds %struct.du_chain* %tmp2, i32 0, i32 0
  %tmp3 = load %struct.du_chain** %next_use, align 8
  %tobool = icmp ne %struct.du_chain* %tmp3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load %struct.du_chain** %last, align 8
  %cl = getelementptr inbounds %struct.du_chain* %tmp4, i32 0, i32 1
  %tmp5 = load i32* %cl, align 4
  %idxprom = sext i32 %tmp5 to i64
  %arrayidx6 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [2 x i64]* %arrayidx6, i32 0, i32 0
  store i64* %arraydecay, i64** %scan_fp_, align 8
  %tmp7 = load i32* %n_uses, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %n_uses, align 4
  %tmp8 = load i64** %scan_fp_, align 8
  %arrayidx9 = getelementptr inbounds i64* %tmp8, i64 0
  %tmp10 = load i64* %arrayidx9
  %neg = xor i64 %tmp10, -1
  %arrayidx11 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  %tmp12 = load i64* %arrayidx11, align 8
  %or = or i64 %tmp12, %neg
  store i64 %or, i64* %arrayidx11, align 8
  %tmp13 = load i64** %scan_fp_, align 8
  %arrayidx14 = getelementptr inbounds i64* %tmp13, i64 1
  %tmp15 = load i64* %arrayidx14
  %neg16 = xor i64 %tmp15, -1
  %arrayidx17 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  %tmp18 = load i64* %arrayidx17, align 8
  %or19 = or i64 %tmp18, %neg16
  store i64 %or19, i64* %arrayidx17, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp20 = load %struct.du_chain** %last, align 8
  %next_use21 = getelementptr inbounds %struct.du_chain* %tmp20, i32 0, i32 0
  %tmp22 = load %struct.du_chain** %next_use21, align 8
  store %struct.du_chain* %tmp22, %struct.du_chain** %last, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp23 = load i32* %n_uses, align 4
  %cmp = icmp slt i32 %tmp23, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  br label %return

if.end:                                           ; preds = %for.end
  %tmp24 = load %struct.du_chain** %last, align 8
  %cl25 = getelementptr inbounds %struct.du_chain* %tmp24, i32 0, i32 1
  %tmp26 = load i32* %cl25, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i32 0, i64 %idxprom27
  %arraydecay29 = getelementptr inbounds [2 x i64]* %arrayidx28, i32 0, i32 0
  store i64* %arraydecay29, i64** %scan_fp_, align 8
  %tmp30 = load i64** %scan_fp_, align 8
  %arrayidx31 = getelementptr inbounds i64* %tmp30, i64 0
  %tmp32 = load i64* %arrayidx31
  %neg33 = xor i64 %tmp32, -1
  %arrayidx34 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  %tmp35 = load i64* %arrayidx34, align 8
  %or36 = or i64 %tmp35, %neg33
  store i64 %or36, i64* %arrayidx34, align 8
  %tmp37 = load i64** %scan_fp_, align 8
  %arrayidx38 = getelementptr inbounds i64* %tmp37, i64 1
  %tmp39 = load i64* %arrayidx38
  %neg40 = xor i64 %tmp39, -1
  %arrayidx41 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  %tmp42 = load i64* %arrayidx41, align 8
  %or43 = or i64 %tmp42, %neg40
  store i64 %or43, i64* %arrayidx41, align 8
  call void @merge_overlapping_regs([2 x i64]* %this_unavailable)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %du1 = alloca %struct.du_chain, align 8
  %du0 = alloca %struct.du_chain, align 8
  store i32 0, i32* %retval
  %tmp = bitcast %struct.du_chain* %du1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%0* @main.du1 to i8*), i64 16, i32 8, i1 false)
  %next_use = getelementptr inbounds %struct.du_chain* %du0, i32 0, i32 0
  store %struct.du_chain* %du1, %struct.du_chain** %next_use, align 8
  %cl = getelementptr inbounds %struct.du_chain* %du0, i32 0, i32 1
  store i32 1, i32* %cl, align 4
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 0, i64 0), align 8
  store i64 -1, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 0, i64 1), align 8
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 1, i64 0), align 8
  store i64 0, i64* getelementptr inbounds ([2 x [2 x i64]]* @reg_class_contents, i32 0, i64 1, i64 1), align 8
  call void @regrename_optimize(%struct.du_chain* %du0)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
