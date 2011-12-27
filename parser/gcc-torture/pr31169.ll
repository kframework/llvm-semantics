; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr31169.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tree_type = type { [2 x i8], [2 x i8] }

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

define i32 @sign_bit_p(%struct.tree_type* %t, i64 %val_hi, i64 %val_lo) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.tree_type*, align 8
  %val_hi.addr = alloca i64, align 8
  %val_lo.addr = alloca i64, align 8
  %mask_lo = alloca i64, align 8
  %lo = alloca i64, align 8
  %mask_hi = alloca i64, align 8
  %hi = alloca i64, align 8
  %width = alloca i32, align 4
  store %struct.tree_type* %t, %struct.tree_type** %t.addr, align 8
  store i64 %val_hi, i64* %val_hi.addr, align 8
  store i64 %val_lo, i64* %val_lo.addr, align 8
  %tmp = load %struct.tree_type** %t.addr, align 8
  %0 = bitcast %struct.tree_type* %tmp to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 511
  store i32 %bf.clear, i32* %width, align 4
  %tmp1 = load i32* %width, align 4
  %conv = sext i32 %tmp1 to i64
  %cmp = icmp ugt i64 %conv, 64
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp3 = load i32* %width, align 4
  %conv4 = sext i32 %tmp3 to i64
  %sub = sub i64 %conv4, 64
  %sub5 = sub i64 %sub, 1
  %shl = shl i64 1, %sub5
  store i64 %shl, i64* %hi, align 8
  store i64 0, i64* %lo, align 8
  %tmp6 = load i32* %width, align 4
  %conv7 = sext i32 %tmp6 to i64
  %sub8 = sub i64 128, %conv7
  %shr = lshr i64 -1, %sub8
  store i64 %shr, i64* %mask_hi, align 8
  store i64 -1, i64* %mask_lo, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store i64 0, i64* %hi, align 8
  %tmp9 = load i32* %width, align 4
  %sub10 = sub nsw i32 %tmp9, 1
  %sh_prom = zext i32 %sub10 to i64
  %shl11 = shl i64 1, %sh_prom
  store i64 %shl11, i64* %lo, align 8
  store i64 0, i64* %mask_hi, align 8
  %tmp12 = load i32* %width, align 4
  %conv13 = sext i32 %tmp12 to i64
  %sub14 = sub i64 64, %conv13
  %shr15 = lshr i64 -1, %sub14
  store i64 %shr15, i64* %mask_lo, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp16 = load i64* %val_hi.addr, align 8
  %tmp17 = load i64* %mask_hi, align 8
  %and = and i64 %tmp16, %tmp17
  %tmp18 = load i64* %hi, align 8
  %cmp19 = icmp eq i64 %and, %tmp18
  br i1 %cmp19, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %if.end
  %tmp21 = load i64* %val_lo.addr, align 8
  %tmp22 = load i64* %mask_lo, align 8
  %and23 = and i64 %tmp21, %tmp22
  %tmp24 = load i64* %lo, align 8
  %cmp25 = icmp eq i64 %and23, %tmp24
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.end28:                                         ; preds = %land.lhs.true, %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end28, %if.then27
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.tree_type, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.tree_type* %t to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -512
  %3 = or i32 %2, 1
  store i32 %3, i32* %0, align 4
  %call = call i32 @sign_bit_p(%struct.tree_type* %t, i64 0, i64 -1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
