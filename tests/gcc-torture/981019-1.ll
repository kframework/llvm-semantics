; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/981019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@f3.x = internal global i32 0, align 4

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

define void @ff(i32 %fname, i32 %part, i32 %nparts) nounwind uwtable {
entry:
  %fname.addr = alloca i32, align 4
  %part.addr = alloca i32, align 4
  %nparts.addr = alloca i32, align 4
  store i32 %fname, i32* %fname.addr, align 4
  store i32 %part, i32* %part.addr, align 4
  store i32 %nparts, i32* %nparts.addr, align 4
  %tmp = load i32* %fname.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %nparts.addr, align 4
  %tobool2 = icmp ne i32 %tmp1, 0
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @f1()
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.else:                                          ; preds = %entry
  store i32 2, i32* %fname.addr, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end16, %if.end4
  %call = call i32 @f3()
  %tobool5 = icmp ne i32 %call, 0
  br i1 %tobool5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp6 = load i32* %nparts.addr, align 4
  %tobool7 = icmp ne i32 %tmp6, 0
  br i1 %tobool7, label %land.lhs.true, label %if.end16

land.lhs.true:                                    ; preds = %while.body
  %call8 = call i32 @f2()
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.end16

if.then10:                                        ; preds = %land.lhs.true
  call void @f1()
  %tmp11 = load i32* %part.addr, align 4
  store i32 %tmp11, i32* %nparts.addr, align 4
  %call12 = call i32 @f3()
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then10
  call void @f1()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.then10
  call void @f1()
  br label %while.end

if.end16:                                         ; preds = %land.lhs.true, %while.body
  br label %while.cond

while.end:                                        ; preds = %if.end15, %while.cond
  %tmp17 = load i32* %nparts.addr, align 4
  %tobool18 = icmp ne i32 %tmp17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %while.end
  call void @f1()
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %while.end
  ret void
}

define void @f1() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @f3() nounwind uwtable {
entry:
  %tmp = load i32* @f3.x, align 4
  %tobool = icmp ne i32 %tmp, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* @f3.x, align 4
  %tmp1 = load i32* @f3.x, align 4
  ret i32 %tmp1
}

define i32 @f2() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @ff(i32 0, i32 1, i32 0)
  ret i32 0
}

declare void @abort() noreturn nounwind
