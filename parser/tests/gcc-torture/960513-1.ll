; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/960513-1.c'
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

define x86_fp80 @f(x86_fp80 %d, i32 %i) nounwind uwtable {
entry:
  %d.addr = alloca x86_fp80, align 16
  %i.addr = alloca i32, align 4
  %e = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %d.addr, align 16
  store i32 %i, i32* %i.addr, align 4
  %tmp = load x86_fp80* %d.addr, align 16
  %sub = fsub x86_fp80 0xK80000000000000000000, %tmp
  store x86_fp80 %sub, x86_fp80* %d.addr, align 16
  %tmp1 = load x86_fp80* %d.addr, align 16
  store x86_fp80 %tmp1, x86_fp80* %e, align 16
  %tmp2 = load i32* %i.addr, align 4
  %cmp = icmp eq i32 %tmp2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp3 = load x86_fp80* %d.addr, align 16
  %mul = fmul x86_fp80 %tmp3, 0xK40008000000000000000
  store x86_fp80 %mul, x86_fp80* %d.addr, align 16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp4 = load x86_fp80* %e, align 16
  %tmp5 = load x86_fp80* %d.addr, align 16
  %mul6 = fmul x86_fp80 %tmp4, %tmp5
  %tmp7 = load x86_fp80* %d.addr, align 16
  %sub8 = fsub x86_fp80 %tmp7, %mul6
  store x86_fp80 %sub8, x86_fp80* %d.addr, align 16
  %tmp9 = load x86_fp80* %e, align 16
  %tmp10 = load x86_fp80* %d.addr, align 16
  %mul11 = fmul x86_fp80 %tmp9, %tmp10
  %tmp12 = load x86_fp80* %d.addr, align 16
  %sub13 = fsub x86_fp80 %tmp12, %mul11
  store x86_fp80 %sub13, x86_fp80* %d.addr, align 16
  %tmp14 = load x86_fp80* %e, align 16
  %tmp15 = load x86_fp80* %d.addr, align 16
  %mul16 = fmul x86_fp80 %tmp14, %tmp15
  %tmp17 = load x86_fp80* %d.addr, align 16
  %sub18 = fsub x86_fp80 %tmp17, %mul16
  store x86_fp80 %sub18, x86_fp80* %d.addr, align 16
  %tmp19 = load x86_fp80* %e, align 16
  %tmp20 = load x86_fp80* %d.addr, align 16
  %mul21 = fmul x86_fp80 %tmp19, %tmp20
  %tmp22 = load x86_fp80* %d.addr, align 16
  %sub23 = fsub x86_fp80 %tmp22, %mul21
  store x86_fp80 %sub23, x86_fp80* %d.addr, align 16
  %tmp24 = load x86_fp80* %e, align 16
  %tmp25 = load x86_fp80* %d.addr, align 16
  %mul26 = fmul x86_fp80 %tmp24, %tmp25
  %tmp27 = load x86_fp80* %d.addr, align 16
  %sub28 = fsub x86_fp80 %tmp27, %mul26
  store x86_fp80 %sub28, x86_fp80* %d.addr, align 16
  %tmp29 = load x86_fp80* %d.addr, align 16
  ret x86_fp80 %tmp29
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call x86_fp80 (...)* bitcast (x86_fp80 (x86_fp80, i32)* @f to x86_fp80 (...)*)(x86_fp80 0xK40008000000000000000, i32 1)
  %conv = fptosi x86_fp80 %call to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %if.end, label %if.then

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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
