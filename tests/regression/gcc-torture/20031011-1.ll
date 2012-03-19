; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031011-1.c'
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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ll_bitsize = alloca i32, align 4
  %ll_bitpos = alloca i32, align 4
  %rl_bitsize = alloca i32, align 4
  %rl_bitpos = alloca i32, align 4
  %end_bit = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 32, i32* %ll_bitpos, align 4
  store i32 32, i32* %ll_bitsize, align 4
  store i32 0, i32* %rl_bitpos, align 4
  store i32 32, i32* %rl_bitsize, align 4
  %tmp = load i32* %ll_bitpos, align 4
  %tmp1 = load i32* %ll_bitsize, align 4
  %add = add nsw i32 %tmp, %tmp1
  %tmp2 = load i32* %rl_bitpos, align 4
  %tmp3 = load i32* %rl_bitsize, align 4
  %add4 = add nsw i32 %tmp2, %tmp3
  %cmp = icmp sgt i32 %add, %add4
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp5 = load i32* %ll_bitpos, align 4
  %tmp6 = load i32* %ll_bitsize, align 4
  %add7 = add nsw i32 %tmp5, %tmp6
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp8 = load i32* %rl_bitpos, align 4
  %tmp9 = load i32* %rl_bitsize, align 4
  %add10 = add nsw i32 %tmp8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add7, %cond.true ], [ %add10, %cond.false ]
  store i32 %cond, i32* %end_bit, align 4
  %tmp11 = load i32* %end_bit, align 4
  %cmp12 = icmp ne i32 %tmp11, 64
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp13 = load i32* %rl_bitpos, align 4
  %tmp14 = load i32* %rl_bitsize, align 4
  %add15 = add nsw i32 %tmp13, %tmp14
  %tmp16 = load i32* %ll_bitpos, align 4
  %tmp17 = load i32* %ll_bitsize, align 4
  %add18 = add nsw i32 %tmp16, %tmp17
  %cmp19 = icmp sgt i32 %add15, %add18
  br i1 %cmp19, label %cond.true20, label %cond.false24

cond.true20:                                      ; preds = %if.end
  %tmp21 = load i32* %rl_bitpos, align 4
  %tmp22 = load i32* %rl_bitsize, align 4
  %add23 = add nsw i32 %tmp21, %tmp22
  br label %cond.end28

cond.false24:                                     ; preds = %if.end
  %tmp25 = load i32* %ll_bitpos, align 4
  %tmp26 = load i32* %ll_bitsize, align 4
  %add27 = add nsw i32 %tmp25, %tmp26
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false24, %cond.true20
  %cond29 = phi i32 [ %add23, %cond.true20 ], [ %add27, %cond.false24 ]
  store i32 %cond29, i32* %end_bit, align 4
  %tmp30 = load i32* %end_bit, align 4
  %cmp31 = icmp ne i32 %tmp30, 64
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %cond.end28
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %cond.end28
  %tmp34 = load i32* %ll_bitpos, align 4
  %tmp35 = load i32* %ll_bitsize, align 4
  %add36 = add nsw i32 %tmp34, %tmp35
  %tmp37 = load i32* %rl_bitpos, align 4
  %tmp38 = load i32* %rl_bitsize, align 4
  %add39 = add nsw i32 %tmp37, %tmp38
  %cmp40 = icmp slt i32 %add36, %add39
  br i1 %cmp40, label %cond.true41, label %cond.false45

cond.true41:                                      ; preds = %if.end33
  %tmp42 = load i32* %ll_bitpos, align 4
  %tmp43 = load i32* %ll_bitsize, align 4
  %add44 = add nsw i32 %tmp42, %tmp43
  br label %cond.end49

cond.false45:                                     ; preds = %if.end33
  %tmp46 = load i32* %rl_bitpos, align 4
  %tmp47 = load i32* %rl_bitsize, align 4
  %add48 = add nsw i32 %tmp46, %tmp47
  br label %cond.end49

cond.end49:                                       ; preds = %cond.false45, %cond.true41
  %cond50 = phi i32 [ %add44, %cond.true41 ], [ %add48, %cond.false45 ]
  store i32 %cond50, i32* %end_bit, align 4
  %tmp51 = load i32* %end_bit, align 4
  %cmp52 = icmp ne i32 %tmp51, 32
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %cond.end49
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %cond.end49
  %tmp55 = load i32* %rl_bitpos, align 4
  %tmp56 = load i32* %rl_bitsize, align 4
  %add57 = add nsw i32 %tmp55, %tmp56
  %tmp58 = load i32* %ll_bitpos, align 4
  %tmp59 = load i32* %ll_bitsize, align 4
  %add60 = add nsw i32 %tmp58, %tmp59
  %cmp61 = icmp slt i32 %add57, %add60
  br i1 %cmp61, label %cond.true62, label %cond.false66

cond.true62:                                      ; preds = %if.end54
  %tmp63 = load i32* %rl_bitpos, align 4
  %tmp64 = load i32* %rl_bitsize, align 4
  %add65 = add nsw i32 %tmp63, %tmp64
  br label %cond.end70

cond.false66:                                     ; preds = %if.end54
  %tmp67 = load i32* %ll_bitpos, align 4
  %tmp68 = load i32* %ll_bitsize, align 4
  %add69 = add nsw i32 %tmp67, %tmp68
  br label %cond.end70

cond.end70:                                       ; preds = %cond.false66, %cond.true62
  %cond71 = phi i32 [ %add65, %cond.true62 ], [ %add69, %cond.false66 ]
  store i32 %cond71, i32* %end_bit, align 4
  %tmp72 = load i32* %end_bit, align 4
  %cmp73 = icmp ne i32 %tmp72, 32
  br i1 %cmp73, label %if.then74, label %if.end75

if.then74:                                        ; preds = %cond.end70
  call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %cond.end70
  ret i32 0
}

declare void @abort() noreturn nounwind
