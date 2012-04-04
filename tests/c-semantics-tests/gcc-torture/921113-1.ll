; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vector_t = type { float, float }
%struct.struct_list = type { float }

@pos = global [1 x %struct.vector_t] zeroinitializer, align 4
@limit = global [2 x %struct.vector_t] [%struct.vector_t zeroinitializer, %struct.vector_t { float 1.000000e+00, float 1.000000e+00 }], align 16

define void @w(float %x, float %y) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  store float %y, float* %y.addr, align 4
  ret void
}

define void @f1(float %x, float %y) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  store float %y, float* %y.addr, align 4
  %0 = load float* %x.addr, align 4
  %cmp = fcmp une float %0, 0.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load float* %y.addr, align 4
  %cmp1 = fcmp une float %1, 0.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define void @f2(float %x, float %y) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  store float %y, float* %y.addr, align 4
  %0 = load float* %x.addr, align 4
  %cmp = fcmp une float %0, 1.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load float* %y.addr, align 4
  %cmp1 = fcmp une float %1, 1.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

define void @gitter(i32 %count, %struct.vector_t* %pos, %struct.struct_list* %list, i32* %nww, %struct.vector_t* %limit, float %r) nounwind uwtable {
entry:
  %count.addr = alloca i32, align 4
  %pos.addr = alloca %struct.vector_t*, align 8
  %list.addr = alloca %struct.struct_list*, align 8
  %nww.addr = alloca i32*, align 8
  %limit.addr = alloca %struct.vector_t*, align 8
  %r.addr = alloca float, align 4
  %d = alloca float, align 4
  %gitt = alloca [128 x [128 x i32]], align 16
  store i32 %count, i32* %count.addr, align 4
  store %struct.vector_t* %pos, %struct.vector_t** %pos.addr, align 8
  store %struct.struct_list* %list, %struct.struct_list** %list.addr, align 8
  store i32* %nww, i32** %nww.addr, align 8
  store %struct.vector_t* %limit, %struct.vector_t** %limit.addr, align 8
  store float %r, float* %r.addr, align 4
  %0 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx = getelementptr inbounds %struct.vector_t* %0, i64 0
  %x = getelementptr inbounds %struct.vector_t* %arrayidx, i32 0, i32 0
  %1 = load float* %x, align 4
  %2 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx1 = getelementptr inbounds %struct.vector_t* %2, i64 0
  %y = getelementptr inbounds %struct.vector_t* %arrayidx1, i32 0, i32 1
  %3 = load float* %y, align 4
  call void @f1(float %1, float %3)
  %4 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx2 = getelementptr inbounds %struct.vector_t* %4, i64 1
  %x3 = getelementptr inbounds %struct.vector_t* %arrayidx2, i32 0, i32 0
  %5 = load float* %x3, align 4
  %6 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx4 = getelementptr inbounds %struct.vector_t* %6, i64 1
  %y5 = getelementptr inbounds %struct.vector_t* %arrayidx4, i32 0, i32 1
  %7 = load float* %y5, align 4
  call void @f2(float %5, float %7)
  %8 = load i32** %nww.addr, align 8
  store i32 0, i32* %8, align 4
  %9 = load %struct.vector_t** %pos.addr, align 8
  %arrayidx6 = getelementptr inbounds %struct.vector_t* %9, i64 0
  %x7 = getelementptr inbounds %struct.vector_t* %arrayidx6, i32 0, i32 0
  %10 = load float* %x7, align 4
  store float %10, float* %d, align 4
  %11 = load float* %d, align 4
  %conv = fpext float %11 to double
  %cmp = fcmp ole double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end15

if.then:                                          ; preds = %entry
  %12 = load float* %d, align 4
  %13 = load float* %r.addr, align 4
  call void @w(float %12, float %13)
  %14 = load float* %d, align 4
  %conv9 = fpext float %14 to double
  %15 = load float* %r.addr, align 4
  %conv10 = fpext float %15 to double
  %mul = fmul double %conv10, 5.000000e-01
  %cmp11 = fcmp ole double %conv9, %mul
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.then
  %16 = load float* %d, align 4
  %17 = load float* %r.addr, align 4
  call void @w(float %16, float %17)
  %18 = load %struct.struct_list** %list.addr, align 8
  %arrayidx14 = getelementptr inbounds %struct.struct_list* %18, i64 0
  %wsx = getelementptr inbounds %struct.struct_list* %arrayidx14, i32 0, i32 0
  store float 1.000000e+00, float* %wsx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then13, %if.then
  br label %if.end15

if.end15:                                         ; preds = %if.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %nww = alloca i32, align 4
  %list = alloca %struct.struct_list, align 4
  store i32 0, i32* %retval
  call void @gitter(i32 1, %struct.vector_t* getelementptr inbounds ([1 x %struct.vector_t]* @pos, i32 0, i32 0), %struct.struct_list* %list, i32* %nww, %struct.vector_t* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i32 0, i32 0), float 1.000000e+00)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
