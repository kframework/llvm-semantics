; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020413-1.c'
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

define void @test(x86_fp80 %val, i32* %eval) nounwind uwtable {
entry:
  %val.addr = alloca x86_fp80, align 16
  %eval.addr = alloca i32*, align 8
  %tmp = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  store x86_fp80 %val, x86_fp80* %val.addr, align 16
  store i32* %eval, i32** %eval.addr, align 8
  store x86_fp80 0xK3FFF8000000000000000, x86_fp80* %tmp, align 16
  store i32 0, i32* %i, align 4
  %tmp2 = load x86_fp80* %val.addr, align 16
  %cmp = fcmp olt x86_fp80 %tmp2, 0xK00000000000000000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp3 = load x86_fp80* %val.addr, align 16
  %sub = fsub x86_fp80 0xK80000000000000000000, %tmp3
  store x86_fp80 %sub, x86_fp80* %val.addr, align 16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp4 = load x86_fp80* %val.addr, align 16
  %tmp5 = load x86_fp80* %tmp, align 16
  %cmp6 = fcmp oge x86_fp80 %tmp4, %tmp5
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end15, %if.then7
  %tmp8 = load x86_fp80* %tmp, align 16
  %tmp9 = load x86_fp80* %val.addr, align 16
  %cmp10 = fcmp olt x86_fp80 %tmp8, %tmp9
  br i1 %cmp10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp11 = load x86_fp80* %tmp, align 16
  %mul = fmul x86_fp80 %tmp11, 0xK40008000000000000000
  store x86_fp80 %mul, x86_fp80* %tmp, align 16
  %tmp12 = load i32* %i, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %i, align 4
  %cmp13 = icmp sge i32 %tmp12, 10
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %while.body
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end32

if.else:                                          ; preds = %if.end
  %tmp16 = load x86_fp80* %val.addr, align 16
  %cmp17 = fcmp une x86_fp80 %tmp16, 0xK00000000000000000000
  br i1 %cmp17, label %if.then18, label %if.end31

if.then18:                                        ; preds = %if.else
  br label %while.cond19

while.cond19:                                     ; preds = %if.end29, %if.then18
  %tmp20 = load x86_fp80* %val.addr, align 16
  %tmp21 = load x86_fp80* %tmp, align 16
  %cmp22 = fcmp olt x86_fp80 %tmp20, %tmp21
  br i1 %cmp22, label %while.body23, label %while.end30

while.body23:                                     ; preds = %while.cond19
  %tmp24 = load x86_fp80* %tmp, align 16
  %div = fdiv x86_fp80 %tmp24, 0xK40008000000000000000
  store x86_fp80 %div, x86_fp80* %tmp, align 16
  %tmp25 = load i32* %i, align 4
  %inc26 = add nsw i32 %tmp25, 1
  store i32 %inc26, i32* %i, align 4
  %cmp27 = icmp sge i32 %tmp25, 10
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %while.body23
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %while.body23
  br label %while.cond19

while.end30:                                      ; preds = %while.cond19
  br label %if.end31

if.end31:                                         ; preds = %while.end30, %if.else
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %while.end
  %tmp33 = load i32* %i, align 4
  %tmp34 = load i32** %eval.addr, align 8
  store i32 %tmp33, i32* %tmp34
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %eval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test(x86_fp80 0xK4000C000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4000E000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK40018000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4001A000000000000000, i32* %eval)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
