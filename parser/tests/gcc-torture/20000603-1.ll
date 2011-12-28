; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s1 = type { double }
%struct.s2 = type { double }
%union.u = type { %struct.s1 }

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

define double @f(%struct.s1* %a, %struct.s1* %b) nounwind uwtable {
entry:
  %a.addr = alloca %struct.s1*, align 8
  %b.addr = alloca %struct.s1*, align 8
  store %struct.s1* %a, %struct.s1** %a.addr, align 8
  store %struct.s1* %b, %struct.s1** %b.addr, align 8
  %tmp = load %struct.s1** %a.addr, align 8
  %d = getelementptr inbounds %struct.s1* %tmp, i32 0, i32 0
  store double 1.000000e+00, double* %d, align 8
  %tmp1 = load %struct.s1** %b.addr, align 8
  %d2 = getelementptr inbounds %struct.s1* %tmp1, i32 0, i32 0
  %tmp3 = load double* %d2, align 8
  %add = fadd double %tmp3, 1.000000e+00
  ret double %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %union.u, align 8
  store i32 0, i32* %retval
  %x = bitcast %union.u* %a to %struct.s1*
  %d = getelementptr inbounds %struct.s1* %x, i32 0, i32 0
  store double 0.000000e+00, double* %d, align 8
  %x1 = bitcast %union.u* %a to %struct.s1*
  %y = bitcast %union.u* %a to %struct.s1*
  %call = call double @f(%struct.s1* %x1, %struct.s1* %y)
  %cmp = fcmp une double %call, 2.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
