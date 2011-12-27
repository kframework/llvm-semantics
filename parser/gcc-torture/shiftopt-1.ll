; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/shiftopt-1.c'
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

define void @utest(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %shr = lshr i32 %tmp, 0
  %tmp1 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %shr, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp2 = load i32* %x.addr, align 4
  %shl = shl i32 %tmp2, 0
  %tmp3 = load i32* %x.addr, align 4
  %cmp4 = icmp ne i32 %shl, %tmp3
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @link_error()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %tmp7 = load i32* %x.addr, align 4
  %shl8 = shl i32 0, %tmp7
  %cmp9 = icmp ne i32 %shl8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end6
  call void @link_error()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end6
  %tmp12 = load i32* %x.addr, align 4
  %shr13 = ashr i32 0, %tmp12
  %cmp14 = icmp ne i32 %shr13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end11
  call void @link_error()
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end11
  %tmp17 = load i32* %x.addr, align 4
  %shr18 = ashr i32 -1, %tmp17
  %cmp19 = icmp ne i32 %shr18, -1
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end16
  call void @link_error()
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end16
  %tmp22 = load i32* %x.addr, align 4
  %shr23 = ashr i32 -1, %tmp22
  %cmp24 = icmp ne i32 %shr23, -1
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end21
  call void @link_error()
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end21
  ret void
}

define void @link_error() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @stest(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %shr = ashr i32 %tmp, 0
  %tmp1 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %shr, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @link_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp2 = load i32* %x.addr, align 4
  %shl = shl i32 %tmp2, 0
  %tmp3 = load i32* %x.addr, align 4
  %cmp4 = icmp ne i32 %shl, %tmp3
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @link_error()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %tmp7 = load i32* %x.addr, align 4
  %shl8 = shl i32 0, %tmp7
  %cmp9 = icmp ne i32 %shl8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end6
  call void @link_error()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end6
  %tmp12 = load i32* %x.addr, align 4
  %shr13 = ashr i32 0, %tmp12
  %cmp14 = icmp ne i32 %shr13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end11
  call void @link_error()
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end11
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @utest(i32 9)
  call void @utest(i32 0)
  call void @stest(i32 9)
  call void @stest(i32 0)
  ret i32 0
}

declare void @abort() noreturn nounwind
