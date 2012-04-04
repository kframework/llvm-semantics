; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.struct_list = type { float }
%struct.vector_t = type { float, float }

@pos = global [1 x %struct.vector_t] zeroinitializer, align 4
@limit = global [2 x %struct.vector_t] [%struct.vector_t zeroinitializer, %struct.vector_t { float 1.000000e+00, float 1.000000e+00 }], align 16

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
  %tmp = load float* %x.addr, align 4
  %cmp = fcmp une float %tmp, 0.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load float* %y.addr, align 4
  %cmp2 = fcmp une float %tmp1, 0.000000e+00
  br i1 %cmp2, label %if.then, label %if.end

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
  %tmp = load float* %x.addr, align 4
  %cmp = fcmp une float %tmp, 1.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load float* %y.addr, align 4
  %cmp2 = fcmp une float %tmp1, 1.000000e+00
  br i1 %cmp2, label %if.then, label %if.end

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
  %tmp = load %struct.vector_t** %limit.addr, align 8
  %arrayidx = getelementptr inbounds %struct.vector_t* %tmp, i64 0
  %x = getelementptr inbounds %struct.vector_t* %arrayidx, i32 0, i32 0
  %tmp1 = load float* %x, align 4
  %tmp2 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx3 = getelementptr inbounds %struct.vector_t* %tmp2, i64 0
  %y = getelementptr inbounds %struct.vector_t* %arrayidx3, i32 0, i32 1
  %tmp4 = load float* %y, align 4
  call void @f1(float %tmp1, float %tmp4)
  %tmp5 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx6 = getelementptr inbounds %struct.vector_t* %tmp5, i64 1
  %x7 = getelementptr inbounds %struct.vector_t* %arrayidx6, i32 0, i32 0
  %tmp8 = load float* %x7, align 4
  %tmp9 = load %struct.vector_t** %limit.addr, align 8
  %arrayidx10 = getelementptr inbounds %struct.vector_t* %tmp9, i64 1
  %y11 = getelementptr inbounds %struct.vector_t* %arrayidx10, i32 0, i32 1
  %tmp12 = load float* %y11, align 4
  call void @f2(float %tmp8, float %tmp12)
  %tmp13 = load i32** %nww.addr, align 8
  store i32 0, i32* %tmp13
  %tmp14 = load %struct.vector_t** %pos.addr, align 8
  %arrayidx15 = getelementptr inbounds %struct.vector_t* %tmp14, i64 0
  %x16 = getelementptr inbounds %struct.vector_t* %arrayidx15, i32 0, i32 0
  %tmp17 = load float* %x16, align 4
  store float %tmp17, float* %d, align 4
  %tmp18 = load float* %d, align 4
  %conv = fpext float %tmp18 to double
  %cmp = fcmp ole double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end33

if.then:                                          ; preds = %entry
  %tmp20 = load float* %d, align 4
  %tmp21 = load float* %r.addr, align 4
  call void @w(float %tmp20, float %tmp21)
  %tmp22 = load float* %d, align 4
  %conv23 = fpext float %tmp22 to double
  %tmp24 = load float* %r.addr, align 4
  %conv25 = fpext float %tmp24 to double
  %mul = fmul double %conv25, 5.000000e-01
  %cmp26 = fcmp ole double %conv23, %mul
  br i1 %cmp26, label %if.then28, label %if.end

if.then28:                                        ; preds = %if.then
  %tmp29 = load float* %d, align 4
  %tmp30 = load float* %r.addr, align 4
  call void @w(float %tmp29, float %tmp30)
  %tmp31 = load %struct.struct_list** %list.addr, align 8
  %arrayidx32 = getelementptr inbounds %struct.struct_list* %tmp31, i64 0
  %wsx = getelementptr inbounds %struct.struct_list* %arrayidx32, i32 0, i32 0
  store float 1.000000e+00, float* %wsx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then28, %if.then
  br label %if.end33

if.end33:                                         ; preds = %if.end, %entry
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
