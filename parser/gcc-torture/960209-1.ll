; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/960209-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type { i8 }

@yabba = global i32 1, align 4
@an_array = common global [5 x %struct.a_struct] zeroinitializer, align 1
@a_ptr = common global %struct.a_struct* null, align 8

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

define i32 @f(i32, i64 %b) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i8, align 1
  %b.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %p = alloca i64, align 8
  %q = alloca i64, align 8
  %r = alloca i64, align 8
  %s = alloca i64, align 8
  %a = trunc i32 %0 to i8
  store i8 %a, i8* %a.addr, align 1
  store i64 %b, i64* %b.addr, align 8
  %tmp = load i64* %b.addr, align 8
  %cmp = icmp ne i64 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end35

if.then:                                          ; preds = %entry
  %tmp1 = load i32* @yabba, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %tmp3 = load i64* %b.addr, align 8
  %div = udiv i64 4000000, %tmp3
  store i64 %div, i64* %s, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc31, %if.end
  %tmp4 = load i64* %i, align 8
  %cmp5 = icmp slt i64 %tmp4, 11
  br i1 %cmp5, label %for.body, label %for.end34

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %j, align 8
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %tmp7 = load i64* %j, align 8
  %cmp8 = icmp slt i64 %tmp7, 256
  br i1 %cmp8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond6
  %tmp10 = load i64* %p, align 8
  %tmp11 = load i64* %s, align 8
  %sub = sub nsw i64 %tmp10, %tmp11
  %cmp12 = icmp slt i64 %sub, 0
  br i1 %cmp12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body9
  %tmp13 = load i64* %s, align 8
  %sub14 = sub nsw i64 0, %tmp13
  br label %cond.end

cond.false:                                       ; preds = %for.body9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub14, %cond.true ], [ 0, %cond.false ]
  %tmp15 = load i64* %q, align 8
  %tmp16 = load i64* %s, align 8
  %sub17 = sub nsw i64 %tmp15, %tmp16
  %cmp18 = icmp slt i64 %sub17, 0
  br i1 %cmp18, label %cond.true19, label %cond.false22

cond.true19:                                      ; preds = %cond.end
  %tmp20 = load i64* %s, align 8
  %sub21 = sub nsw i64 0, %tmp20
  br label %cond.end24

cond.false22:                                     ; preds = %cond.end
  %tmp23 = load i64* %q, align 8
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false22, %cond.true19
  %cond25 = phi i64 [ %sub21, %cond.true19 ], [ %tmp23, %cond.false22 ]
  %cmp26 = icmp slt i64 %cond, %cond25
  br i1 %cmp26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %cond.end24
  %tmp28 = load i64* %i, align 8
  store i64 %tmp28, i64* %r, align 8
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %cond.end24
  br label %for.inc

for.inc:                                          ; preds = %if.end29
  %tmp30 = load i64* %j, align 8
  %inc = add nsw i64 %tmp30, 1
  store i64 %inc, i64* %j, align 8
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc31

for.inc31:                                        ; preds = %for.end
  %tmp32 = load i64* %i, align 8
  %inc33 = add nsw i64 %tmp32, 1
  store i64 %inc33, i64* %i, align 8
  br label %for.cond

for.end34:                                        ; preds = %for.cond
  br label %if.end35

if.end35:                                         ; preds = %for.end34, %entry
  %tmp36 = load i32* @yabba, align 4
  %tobool37 = icmp ne i32 %tmp36, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end35
  store i32 0, i32* %retval
  br label %return

if.end39:                                         ; preds = %if.end35
  %tmp40 = load i8* %a.addr, align 1
  %idxprom = zext i8 %tmp40 to i64
  %arrayidx = getelementptr inbounds [5 x %struct.a_struct]* @an_array, i32 0, i64 %idxprom
  store %struct.a_struct* %arrayidx, %struct.a_struct** @a_ptr, align 8
  %tmp41 = load i64* %r, align 8
  %conv = trunc i64 %tmp41 to i8
  %tmp42 = load %struct.a_struct** @a_ptr, align 8
  %a_character = getelementptr inbounds %struct.a_struct* %tmp42, i32 0, i32 0
  store i8 %conv, i8* %a_character, align 1
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end39, %if.then38, %if.then2
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32, i64)* @f to i32 (...)*)(i32 1, i64 0)
  %cmp = icmp ne i32 %call, 0
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
