; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr15262.c'
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

define void @bar(float* %p) nounwind uwtable {
entry:
  %p.addr = alloca float*, align 8
  store float* %p, float** %p.addr, align 8
  %tmp = load float** %p.addr, align 8
  store float 0x4014CCCCC0000000, float* %tmp
  ret void
}

define i32 @foo(%struct.A* %locp, i32 %i, i32 %str) nounwind uwtable {
entry:
  %locp.addr = alloca %struct.A*, align 8
  %i.addr = alloca i32, align 4
  %str.addr = alloca i32, align 4
  %f = alloca float, align 4
  %g = alloca float, align 4
  %p = alloca float*, align 8
  %T355 = alloca i32, align 4
  %T356 = alloca i32*, align 8
  store %struct.A* %locp, %struct.A** %locp.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %str, i32* %str.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float* [ %g, %cond.true ], [ %f, %cond.false ]
  store float* %cond, float** %p, align 8
  %tmp1 = load float** %p, align 8
  call void @bar(float* %tmp1)
  %tmp2 = load float** %p, align 8
  %tmp3 = load float* %tmp2
  %conv = fpext float %tmp3 to double
  %cmp = fcmp ogt double %conv, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 1, i32* %str.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %tmp5 = load %struct.A** %locp.addr, align 8
  %i6 = getelementptr inbounds %struct.A* %tmp5, i32 0, i32 1
  %tmp7 = load i32* %i6, align 4
  store i32 %tmp7, i32* %T355, align 4
  %tmp8 = load %struct.A** %locp.addr, align 8
  %i9 = getelementptr inbounds %struct.A* %tmp8, i32 0, i32 1
  store i32* %i9, i32** %T356, align 8
  %tmp10 = load i32* %str.addr, align 4
  %tmp11 = load i32** %T356, align 8
  store i32 %tmp10, i32* %tmp11
  %tmp12 = load %struct.A** %locp.addr, align 8
  %i13 = getelementptr inbounds %struct.A* %tmp12, i32 0, i32 1
  %tmp14 = load i32* %i13, align 4
  store i32 %tmp14, i32* %T355, align 4
  %tmp15 = load i32* %T355, align 4
  ret i32 %tmp15
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %loc = alloca %struct.A, align 4
  %str = alloca i32, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.A* %loc, i32 0, i32 1
  store i32 2, i32* %i, align 4
  %call = call i32 @foo(%struct.A* %loc, i32 10, i32 3)
  store i32 %call, i32* %str, align 4
  %tmp = load i32* %str, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
