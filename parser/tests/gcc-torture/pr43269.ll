; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr43269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_261 = common global i32 0, align 4
@g_21 = common global i32 0, align 4
@g_211 = common global i32 0, align 4

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @func_32(i32 0)
  %tmp = load i32* @g_261, align 4
  %cmp = icmp ne i32 %tmp, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal void @func_32(i32 %b) nounwind uwtable noinline {
entry:
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %b.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %lbl_370

lbl_370:                                          ; preds = %if.else, %if.then
  store i32 1, i32* @g_21, align 4
  br label %if.end

if.end:                                           ; preds = %lbl_370, %entry
  store i32 -1, i32* @g_261, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp1 = load i32* @g_261, align 4
  %cmp = icmp sgt i32 %tmp1, -2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* @g_211, align 4
  %add = add nsw i32 %tmp2, 1
  %tobool3 = icmp ne i32 %add, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %for.body
  br label %for.end

if.else:                                          ; preds = %for.body
  store i32 1, i32* @g_21, align 4
  br label %lbl_370

for.inc:                                          ; No predecessors!
  %tmp5 = load i32* @g_261, align 4
  %dec = add nsw i32 %tmp5, -1
  store i32 %dec, i32* @g_261, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then4, %for.cond
  ret void
}

declare void @abort() noreturn nounwind
