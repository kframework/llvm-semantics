; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/941031-1.c'
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

define i32 @f(i64 %us, i64 %vs) nounwind uwtable {
entry:
  %us.addr = alloca i64, align 8
  %vs.addr = alloca i64, align 8
  %aus = alloca i64, align 8
  %avs = alloca i64, align 8
  %t = alloca i64, align 8
  store i64 %us, i64* %us.addr, align 8
  store i64 %vs, i64* %vs.addr, align 8
  %tmp = load i64* %us.addr, align 8
  %cmp = icmp sge i64 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i64* %us.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i64* %us.addr, align 8
  %sub = sub nsw i64 0, %tmp2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %tmp1, %cond.true ], [ %sub, %cond.false ]
  store i64 %cond, i64* %aus, align 8
  %tmp3 = load i64* %vs.addr, align 8
  %cmp4 = icmp sge i64 %tmp3, 0
  br i1 %cmp4, label %cond.true5, label %cond.false7

cond.true5:                                       ; preds = %cond.end
  %tmp6 = load i64* %vs.addr, align 8
  br label %cond.end10

cond.false7:                                      ; preds = %cond.end
  %tmp8 = load i64* %vs.addr, align 8
  %sub9 = sub nsw i64 0, %tmp8
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false7, %cond.true5
  %cond11 = phi i64 [ %tmp6, %cond.true5 ], [ %sub9, %cond.false7 ]
  store i64 %cond11, i64* %avs, align 8
  %tmp12 = load i64* %aus, align 8
  %tmp13 = load i64* %avs, align 8
  %cmp14 = icmp slt i64 %tmp12, %tmp13
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end10
  %tmp16 = load i64* %aus, align 8
  store i64 %tmp16, i64* %t, align 8
  %tmp17 = load i64* %avs, align 8
  store i64 %tmp17, i64* %aus, align 8
  %tmp18 = load i64* %aus, align 8
  store i64 %tmp18, i64* %avs, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end10
  %tmp19 = load i64* %avs, align 8
  %conv = trunc i64 %tmp19 to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i64 3, i64 17)
  %cmp = icmp ne i32 %call, 17
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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
