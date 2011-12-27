; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990127-1.c'
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %pa = alloca i32*, align 8
  %pb = alloca i32*, align 8
  %pc = alloca i32*, align 8
  %ppa = alloca i32**, align 8
  %ppb = alloca i32**, align 8
  %ppc = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4
  store i32 30, i32* %c, align 4
  store i32* %a, i32** %pa, align 8
  store i32* %b, i32** %pb, align 8
  store i32* %c, i32** %pc, align 8
  store i32** %pa, i32*** %ppa, align 8
  store i32** %pb, i32*** %ppb, align 8
  store i32** %pc, i32*** %ppc, align 8
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  store i32 0, i32* %z, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32** %pa, align 8
  %cmp2 = icmp eq i32* %tmp1, %a
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32* %b, i32** %pa, align 8
  br label %if.end

if.else:                                          ; preds = %for.body
  store i32* %a, i32** %pa, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.cond:                                       ; preds = %if.end11, %if.end
  %tmp3 = load i32** %pa, align 8
  %tmp4 = load i32* %tmp3
  %dec = add nsw i32 %tmp4, -1
  store i32 %dec, i32* %tmp3
  %tobool = icmp ne i32 %tmp4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp5 = load i32* %x, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %x, align 4
  %tmp6 = load i32** %pa, align 8
  %tmp7 = load i32* %tmp6
  %cmp8 = icmp slt i32 %tmp7, 3
  br i1 %cmp8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %while.body
  br label %while.end

if.else10:                                        ; preds = %while.body
  store i32* %b, i32** %pa, align 8
  br label %if.end11

if.end11:                                         ; preds = %if.else10
  br label %while.cond

while.end:                                        ; preds = %if.then9, %while.cond
  %tmp12 = load i32* %x, align 4
  %inc13 = add nsw i32 %tmp12, 1
  store i32 %inc13, i32* %x, align 4
  store i32* %b, i32** %pa, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %tmp14 = load i32* %i, align 4
  %inc15 = add nsw i32 %tmp14, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp16 = load i32** %pa, align 8
  %tmp17 = load i32* %tmp16
  %cmp18 = icmp ne i32 %tmp17, -5
  br i1 %cmp18, label %if.then25, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %tmp19 = load i32** %pb, align 8
  %tmp20 = load i32* %tmp19
  %cmp21 = icmp ne i32 %tmp20, -5
  br i1 %cmp21, label %if.then25, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false
  %tmp23 = load i32* %x, align 4
  %cmp24 = icmp ne i32 %tmp23, 43
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %lor.lhs.false22, %lor.lhs.false, %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %lor.lhs.false22
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
