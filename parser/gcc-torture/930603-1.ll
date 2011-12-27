; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define float @fx(double) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  %x = fptrunc double %0 to float
  store float %x, float* %x.addr, align 4
  %tmp = load float* %x.addr, align 4
  %conv = fpext float %tmp to double
  %mul = fmul double 0x40026BB1BBB58975, %conv
  %div = fdiv double 3.000000e+00, %mul
  %add = fadd double 1.000000e+00, %div
  %conv1 = fptrunc double %add to float
  ret float %conv1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca float, align 4
  %b = alloca float, align 4
  %c = alloca float, align 4
  store i32 0, i32* %retval
  %call = call float @inita()
  store float %call, float* %a, align 4
  %call1 = call float @initc()
  store float %call1, float* %c, align 4
  call void @f()
  %tmp = load float* %c, align 4
  %conv = fpext float %tmp to double
  %call2 = call float @fx(double %conv)
  %tmp3 = load float* %a, align 4
  %add = fadd float %call2, %tmp3
  store float %add, float* %b, align 4
  call void @f()
  %tmp4 = load float* %a, align 4
  %conv5 = fpext float %tmp4 to double
  %cmp = fcmp une double %conv5, 3.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp7 = load float* %b, align 4
  %conv8 = fpext float %tmp7 to double
  %cmp9 = fcmp olt double %conv8, 4.325700e+00
  br i1 %cmp9, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false
  %tmp12 = load float* %b, align 4
  %conv13 = fpext float %tmp12 to double
  %cmp14 = fcmp ogt double %conv13, 4.325800e+00
  br i1 %cmp14, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false11
  %tmp17 = load float* %c, align 4
  %conv18 = fpext float %tmp17 to double
  %cmp19 = fcmp une double %conv18, 4.000000e+00
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false16, %lor.lhs.false11, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false16
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define float @inita() nounwind uwtable {
entry:
  ret float 3.000000e+00
}

define float @initc() nounwind uwtable {
entry:
  ret float 4.000000e+00
}

define void @f() nounwind uwtable {
entry:
  ret void
}
