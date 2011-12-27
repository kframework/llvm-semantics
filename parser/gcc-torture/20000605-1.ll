; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000605-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._RenderInfo = type { i32, float, i32 }

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %info = alloca %struct._RenderInfo, align 4
  store i32 0, i32* %retval
  %y = getelementptr inbounds %struct._RenderInfo* %info, i32 0, i32 0
  store i32 0, i32* %y, align 4
  %src_y = getelementptr inbounds %struct._RenderInfo* %info, i32 0, i32 2
  store i32 0, i32* %src_y, align 4
  %scaley = getelementptr inbounds %struct._RenderInfo* %info, i32 0, i32 1
  store float 1.000000e+00, float* %scaley, align 4
  %call = call i32 @render_image_rgb_a(%struct._RenderInfo* %info)
  %cmp = icmp ne i32 %call, 256
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @render_image_rgb_a(%struct._RenderInfo* %info) nounwind uwtable {
entry:
  %info.addr = alloca %struct._RenderInfo*, align 8
  %y = alloca i32, align 4
  %ye = alloca i32, align 4
  %error = alloca float, align 4
  %step = alloca float, align 4
  store %struct._RenderInfo* %info, %struct._RenderInfo** %info.addr, align 8
  %tmp = load %struct._RenderInfo** %info.addr, align 8
  %y1 = getelementptr inbounds %struct._RenderInfo* %tmp, i32 0, i32 0
  %tmp2 = load i32* %y1, align 4
  store i32 %tmp2, i32* %y, align 4
  store i32 256, i32* %ye, align 4
  %tmp3 = load %struct._RenderInfo** %info.addr, align 8
  %scaley = getelementptr inbounds %struct._RenderInfo* %tmp3, i32 0, i32 1
  %tmp4 = load float* %scaley, align 4
  %conv = fpext float %tmp4 to double
  %div = fdiv double 1.000000e+00, %conv
  %conv5 = fptrunc double %div to float
  store float %conv5, float* %step, align 4
  %tmp6 = load i32* %y, align 4
  %conv7 = sitofp i32 %tmp6 to float
  %tmp8 = load float* %step, align 4
  %mul = fmul float %conv7, %tmp8
  store float %mul, float* %error, align 4
  %tmp9 = load float* %error, align 4
  %conv10 = fptosi float %tmp9 to i32
  %conv11 = sitofp i32 %conv10 to float
  %tmp12 = load float* %step, align 4
  %sub = fsub float %conv11, %tmp12
  %tmp13 = load float* %error, align 4
  %sub14 = fsub float %tmp13, %sub
  store float %sub14, float* %error, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp15 = load i32* %y, align 4
  %tmp16 = load i32* %ye, align 4
  %cmp = icmp slt i32 %tmp15, %tmp16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp18 = load float* %error, align 4
  %conv19 = fpext float %tmp18 to double
  %cmp20 = fcmp oge double %conv19, 1.000000e+00
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp22 = load float* %error, align 4
  %conv23 = fptosi float %tmp22 to i32
  %tmp24 = load %struct._RenderInfo** %info.addr, align 8
  %src_y = getelementptr inbounds %struct._RenderInfo* %tmp24, i32 0, i32 2
  %tmp25 = load i32* %src_y, align 4
  %add = add nsw i32 %tmp25, %conv23
  store i32 %add, i32* %src_y, align 4
  %tmp26 = load float* %error, align 4
  %conv27 = fptosi float %tmp26 to i32
  %conv28 = sitofp i32 %conv27 to float
  %tmp29 = load float* %error, align 4
  %sub30 = fsub float %tmp29, %conv28
  store float %sub30, float* %error, align 4
  call void @bar()
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %tmp31 = load float* %step, align 4
  %tmp32 = load float* %error, align 4
  %add33 = fadd float %tmp32, %tmp31
  store float %add33, float* %error, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp34 = load i32* %y, align 4
  %inc = add nsw i32 %tmp34, 1
  store i32 %inc, i32* %y, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp35 = load %struct._RenderInfo** %info.addr, align 8
  %src_y36 = getelementptr inbounds %struct._RenderInfo* %tmp35, i32 0, i32 2
  %tmp37 = load i32* %src_y36, align 4
  ret i32 %tmp37
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal void @bar() nounwind uwtable {
entry:
  ret void
}
