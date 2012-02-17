; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr15262-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { i32*, float }

@X = common global float 0.000000e+00, align 4

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

define i32 @foo(i32* %b.coerce0, float %b.coerce1, %struct.A* %q, float* %h) nounwind uwtable {
entry:
  %b = alloca %struct.B, align 8
  %q.addr = alloca %struct.A*, align 8
  %h.addr = alloca float*, align 8
  %0 = getelementptr %struct.B* %b, i32 0, i32 0
  store i32* %b.coerce0, i32** %0
  %1 = getelementptr %struct.B* %b, i32 0, i32 1
  store float %b.coerce1, float* %1
  store %struct.A* %q, %struct.A** %q.addr, align 8
  store float* %h, float** %h.addr, align 8
  %tmp = load float** %h.addr, align 8
  %tmp1 = load float* %tmp
  %tmp2 = load float* @X, align 4
  %add = fadd float %tmp2, %tmp1
  store float %add, float* @X, align 4
  %p = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %tmp3 = load i32** %p, align 8
  store i32 3, i32* %tmp3
  %tmp4 = load %struct.A** %q.addr, align 8
  %t = getelementptr inbounds %struct.A* %tmp4, i32 0, i32 0
  store i32 2, i32* %t, align 4
  %p5 = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %tmp6 = load i32** %p5, align 8
  %tmp7 = load i32* %tmp6
  ret i32 %tmp7
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %b = alloca %struct.B, align 8
  store i32 0, i32* %retval
  %t = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %p = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  store i32* %t, i32** %p, align 8
  %0 = getelementptr %struct.B* %b, i32 0, i32 0
  %1 = load i32** %0, align 1
  %2 = getelementptr %struct.B* %b, i32 0, i32 1
  %3 = load float* %2, align 1
  %call = call i32 @foo(i32* %1, float %3, %struct.A* %a, float* @X)
  %cmp = icmp eq i32 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
