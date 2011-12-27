; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr15262-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

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

define i32 @foo() nounwind uwtable {
entry:
  ret i32 3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %loc = alloca %struct.A, align 4
  %locp = alloca %struct.A*, align 8
  %f = alloca float, align 4
  %g = alloca float, align 4
  %p = alloca float*, align 8
  %T355 = alloca i32, align 4
  %T356 = alloca i32*, align 8
  store i32 0, i32* %retval
  store float 3.000000e+00, float* %f, align 4
  store float 2.000000e+00, float* %g, align 4
  %call = call i32 @foo()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float* [ %g, %cond.true ], [ %f, %cond.false ]
  store float* %cond, float** %p, align 8
  %tmp = load float** %p, align 8
  %tmp1 = load float* %tmp
  %conv = fpext float %tmp1 to double
  %cmp = fcmp ogt double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store float 1.000000e+00, float* %g, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %call3 = call noalias i8* @malloc(i64 8) nounwind
  %0 = bitcast i8* %call3 to %struct.A*
  store %struct.A* %0, %struct.A** %locp, align 8
  %tmp4 = load %struct.A** %locp, align 8
  %i = getelementptr inbounds %struct.A* %tmp4, i32 0, i32 1
  store i32 10, i32* %i, align 4
  %tmp5 = load %struct.A** %locp, align 8
  %i6 = getelementptr inbounds %struct.A* %tmp5, i32 0, i32 1
  %tmp7 = load i32* %i6, align 4
  store i32 %tmp7, i32* %T355, align 4
  %tmp8 = load %struct.A** %locp, align 8
  %i9 = getelementptr inbounds %struct.A* %tmp8, i32 0, i32 1
  store i32* %i9, i32** %T356, align 8
  %tmp10 = load i32** %T356, align 8
  store i32 1, i32* %tmp10
  %tmp11 = load %struct.A** %locp, align 8
  %i12 = getelementptr inbounds %struct.A* %tmp11, i32 0, i32 1
  %tmp13 = load i32* %i12, align 4
  store i32 %tmp13, i32* %T355, align 4
  %tmp14 = load i32* %T355, align 4
  %cmp15 = icmp ne i32 %tmp14, 1
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @abort() noreturn nounwind
