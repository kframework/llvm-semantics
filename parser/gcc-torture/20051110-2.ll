; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051110-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1
@flag = common global i32 0, align 4

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

define void @add_unwind_adjustsp(i64 %offset) nounwind uwtable {
entry:
  %offset.addr = alloca i64, align 8
  %n = alloca i32, align 4
  %o = alloca i64, align 8
  store i64 %offset, i64* %offset.addr, align 8
  %tmp = load i64* %offset.addr, align 8
  %sub = sub nsw i64 %tmp, 516
  %shr = ashr i64 %sub, 2
  store i64 %shr, i64* %o, align 8
  store i32 0, i32* %n, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  br label %a

a:                                                ; preds = %if.then14, %do.body
  %tmp1 = load i64* %o, align 8
  %and = and i64 %tmp1, 127
  %conv = trunc i64 %and to i8
  %tmp2 = load i32* %n, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  %tmp3 = load i64* %o, align 8
  %shr4 = lshr i64 %tmp3, 7
  store i64 %shr4, i64* %o, align 8
  %tmp5 = load i64* %o, align 8
  %tobool = icmp ne i64 %tmp5, 0
  br i1 %tobool, label %if.then, label %if.end15

if.then:                                          ; preds = %a
  %tmp6 = load i32* %n, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %arrayidx8 = getelementptr inbounds [5 x i8]* @bytes, i32 0, i64 %idxprom7
  %tmp9 = load i8* %arrayidx8, align 1
  %conv10 = zext i8 %tmp9 to i32
  %or = or i32 %conv10, 128
  %conv11 = trunc i32 %or to i8
  store i8 %conv11, i8* %arrayidx8, align 1
  %tmp12 = load i32* @flag, align 4
  %tobool13 = icmp ne i32 %tmp12, 0
  br i1 %tobool13, label %if.then14, label %if.end

if.then14:                                        ; preds = %if.then
  br label %a

if.end:                                           ; preds = %if.then
  br label %if.end15

if.end15:                                         ; preds = %if.end, %a
  %tmp16 = load i32* %n, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %n, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end15
  %tmp17 = load i64* %o, align 8
  %tobool18 = icmp ne i64 %tmp17, 0
  br i1 %tobool18, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @add_unwind_adjustsp(i64 4132)
  %tmp = load i8* getelementptr inbounds ([5 x i8]* @bytes, i32 0, i64 0), align 1
  %conv = zext i8 %tmp to i32
  %cmp = icmp ne i32 %conv, 136
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i8* getelementptr inbounds ([5 x i8]* @bytes, i32 0, i64 1), align 1
  %conv3 = zext i8 %tmp2 to i32
  %cmp4 = icmp ne i32 %conv3, 7
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn nounwind
