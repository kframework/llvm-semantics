; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000605-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._RenderInfo = type { i32, float, i32 }

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
  %0 = load %struct._RenderInfo** %info.addr, align 8
  %y1 = getelementptr inbounds %struct._RenderInfo* %0, i32 0, i32 0
  %1 = load i32* %y1, align 4
  store i32 %1, i32* %y, align 4
  store i32 256, i32* %ye, align 4
  %2 = load %struct._RenderInfo** %info.addr, align 8
  %scaley = getelementptr inbounds %struct._RenderInfo* %2, i32 0, i32 1
  %3 = load float* %scaley, align 4
  %conv = fpext float %3 to double
  %div = fdiv double 1.000000e+00, %conv
  %conv2 = fptrunc double %div to float
  store float %conv2, float* %step, align 4
  %4 = load i32* %y, align 4
  %conv3 = sitofp i32 %4 to float
  %5 = load float* %step, align 4
  %mul = fmul float %conv3, %5
  store float %mul, float* %error, align 4
  %6 = load float* %error, align 4
  %conv4 = fptosi float %6 to i32
  %conv5 = sitofp i32 %conv4 to float
  %7 = load float* %step, align 4
  %sub = fsub float %conv5, %7
  %8 = load float* %error, align 4
  %sub6 = fsub float %8, %sub
  store float %sub6, float* %error, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32* %y, align 4
  %10 = load i32* %ye, align 4
  %cmp = icmp slt i32 %9, %10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load float* %error, align 4
  %conv8 = fpext float %11 to double
  %cmp9 = fcmp oge double %conv8, 1.000000e+00
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %12 = load float* %error, align 4
  %conv11 = fptosi float %12 to i32
  %13 = load %struct._RenderInfo** %info.addr, align 8
  %src_y = getelementptr inbounds %struct._RenderInfo* %13, i32 0, i32 2
  %14 = load i32* %src_y, align 4
  %add = add nsw i32 %14, %conv11
  store i32 %add, i32* %src_y, align 4
  %15 = load float* %error, align 4
  %conv12 = fptosi float %15 to i32
  %conv13 = sitofp i32 %conv12 to float
  %16 = load float* %error, align 4
  %sub14 = fsub float %16, %conv13
  store float %sub14, float* %error, align 4
  call void @bar()
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %17 = load float* %step, align 4
  %18 = load float* %error, align 4
  %add15 = fadd float %18, %17
  store float %add15, float* %error, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %19 = load i32* %y, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %y, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load %struct._RenderInfo** %info.addr, align 8
  %src_y16 = getelementptr inbounds %struct._RenderInfo* %20, i32 0, i32 2
  %21 = load i32* %src_y16, align 4
  ret i32 %21
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal void @bar() nounwind uwtable {
entry:
  ret void
}
