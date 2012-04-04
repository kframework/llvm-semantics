; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31169.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tree_type = type { [2 x i8], [2 x i8] }

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
  %0 = load %struct.tree_type** %t.addr, align 8
  %1 = bitcast %struct.tree_type* %0 to i32*
  %2 = load i32* %1, align 4
  %bf.clear = and i32 %2, 511
  store i32 %bf.clear, i32* %width, align 4
  %3 = load i32* %width, align 4
  %conv = sext i32 %3 to i64
  %cmp = icmp ugt i64 %conv, 64
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32* %width, align 4
  %conv2 = sext i32 %4 to i64
  %sub = sub i64 %conv2, 64
  %sub3 = sub i64 %sub, 1
  %shl = shl i64 1, %sub3
  store i64 %shl, i64* %hi, align 8
  store i64 0, i64* %lo, align 8
  %5 = load i32* %width, align 4
  %conv4 = sext i32 %5 to i64
  %sub5 = sub i64 128, %conv4
  %shr = lshr i64 -1, %sub5
  store i64 %shr, i64* %mask_hi, align 8
  store i64 -1, i64* %mask_lo, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store i64 0, i64* %hi, align 8
  %6 = load i32* %width, align 4
  %sub6 = sub nsw i32 %6, 1
  %sh_prom = zext i32 %sub6 to i64
  %shl7 = shl i64 1, %sh_prom
  store i64 %shl7, i64* %lo, align 8
  store i64 0, i64* %mask_hi, align 8
  %7 = load i32* %width, align 4
  %conv8 = sext i32 %7 to i64
  %sub9 = sub i64 64, %conv8
  %shr10 = lshr i64 -1, %sub9
  store i64 %shr10, i64* %mask_lo, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i64* %val_hi.addr, align 8
  %9 = load i64* %mask_hi, align 8
  %and = and i64 %8, %9
  %10 = load i64* %hi, align 8
  %cmp11 = icmp eq i64 %and, %10
  br i1 %cmp11, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.end
  %11 = load i64* %val_lo.addr, align 8
  %12 = load i64* %mask_lo, align 8
  %and13 = and i64 %11, %12
  %13 = load i64* %lo, align 8
  %cmp14 = icmp eq i64 %and13, %13
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.end17:                                         ; preds = %land.lhs.true, %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end17, %if.then16
  %14 = load i32* %retval
  ret i32 %14
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
