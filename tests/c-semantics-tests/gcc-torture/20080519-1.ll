; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080519-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.du_chain = type { %struct.du_chain*, i32 }

@reg_class_contents = common global [2 x [2 x i64]] zeroinitializer, align 16
@main.du1 = private unnamed_addr constant { %struct.du_chain*, i32, [4 x i8] } { %struct.du_chain* null, i32 0, [4 x i8] undef }, align 8

define void @merge_overlapping_regs([2 x i64]* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca [2 x i64]*, align 8
  store [2 x i64]* %p, [2 x i64]** %p.addr, align 8
  %0 = load [2 x i64]** %p.addr, align 8
  %arrayidx = getelementptr inbounds [2 x i64]* %0, i32 0, i64 0
  %1 = load i64* %arrayidx, align 8
  %cmp = icmp ne i64 %1, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load [2 x i64]** %p.addr, align 8
  %arrayidx1 = getelementptr inbounds [2 x i64]* %2, i32 0, i64 1
  %3 = load i64* %arrayidx1, align 8
  %cmp2 = icmp ne i64 %3, -1
  br i1 %cmp2, label %if.then, label %if.end

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
  %0 = load %struct.du_chain** %this.addr, align 8
  store %struct.du_chain* %0, %struct.du_chain** %last, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.du_chain** %last, align 8
  %next_use = getelementptr inbounds %struct.du_chain* %1, i32 0, i32 0
  %2 = load %struct.du_chain** %next_use, align 8
  %tobool = icmp ne %struct.du_chain* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.du_chain** %last, align 8
  %cl = getelementptr inbounds %struct.du_chain* %3, i32 0, i32 1
  %4 = load i32* %cl, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [2 x i64]* %arrayidx2, i32 0, i32 0
  store i64* %arraydecay, i64** %scan_fp_, align 8
  %5 = load i32* %n_uses, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %n_uses, align 4
  %6 = load i64** %scan_fp_, align 8
  %arrayidx3 = getelementptr inbounds i64* %6, i64 0
  %7 = load i64* %arrayidx3, align 8
  %neg = xor i64 %7, -1
  %arrayidx4 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  %8 = load i64* %arrayidx4, align 8
  %or = or i64 %8, %neg
  store i64 %or, i64* %arrayidx4, align 8
  %9 = load i64** %scan_fp_, align 8
  %arrayidx5 = getelementptr inbounds i64* %9, i64 1
  %10 = load i64* %arrayidx5, align 8
  %neg6 = xor i64 %10, -1
  %arrayidx7 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  %11 = load i64* %arrayidx7, align 8
  %or8 = or i64 %11, %neg6
  store i64 %or8, i64* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load %struct.du_chain** %last, align 8
  %next_use9 = getelementptr inbounds %struct.du_chain* %12, i32 0, i32 0
  %13 = load %struct.du_chain** %next_use9, align 8
  store %struct.du_chain* %13, %struct.du_chain** %last, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load i32* %n_uses, align 4
  %cmp = icmp slt i32 %14, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  br label %return

if.end:                                           ; preds = %for.end
  %15 = load %struct.du_chain** %last, align 8
  %cl10 = getelementptr inbounds %struct.du_chain* %15, i32 0, i32 1
  %16 = load i32* %cl10, align 4
  %idxprom11 = sext i32 %16 to i64
  %arrayidx12 = getelementptr inbounds [2 x [2 x i64]]* @reg_class_contents, i32 0, i64 %idxprom11
  %arraydecay13 = getelementptr inbounds [2 x i64]* %arrayidx12, i32 0, i32 0
  store i64* %arraydecay13, i64** %scan_fp_, align 8
  %17 = load i64** %scan_fp_, align 8
  %arrayidx14 = getelementptr inbounds i64* %17, i64 0
  %18 = load i64* %arrayidx14, align 8
  %neg15 = xor i64 %18, -1
  %arrayidx16 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 0
  %19 = load i64* %arrayidx16, align 8
  %or17 = or i64 %19, %neg15
  store i64 %or17, i64* %arrayidx16, align 8
  %20 = load i64** %scan_fp_, align 8
  %arrayidx18 = getelementptr inbounds i64* %20, i64 1
  %21 = load i64* %arrayidx18, align 8
  %neg19 = xor i64 %21, -1
  %arrayidx20 = getelementptr inbounds [2 x i64]* %this_unavailable, i32 0, i64 1
  %22 = load i64* %arrayidx20, align 8
  %or21 = or i64 %22, %neg19
  store i64 %or21, i64* %arrayidx20, align 8
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
  %0 = bitcast %struct.du_chain* %du1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ({ %struct.du_chain*, i32, [4 x i8] }* @main.du1 to i8*), i64 16, i32 8, i1 false)
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
