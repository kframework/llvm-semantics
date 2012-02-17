; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr24716.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@Link = global [1 x i32] [i32 -1], align 4
@W = global [1 x i32] [i32 2], align 4

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

define i32 @f(i32 %k, i32 %p) nounwind uwtable {
entry:
  %k.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %pdest = alloca i32, align 4
  %j = alloca i32, align 4
  %D1361 = alloca i32, align 4
  store i32 %k, i32* %k.addr, align 4
  store i32 %p, i32* %p.addr, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %pdest, align 4
  br label %for.cond

for.cond:                                         ; preds = %do.end60, %entry
  %tmp = load i32* %pdest, align 4
  %cmp = icmp sgt i32 %tmp, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %tmp1 = load i32* %j, align 4
  %dec = add nsw i32 %tmp1, -1
  store i32 %dec, i32* %j, align 4
  %tmp2 = load i32* %pdest, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %pdest, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp3 = load i32* %j, align 4
  %cmp4 = icmp sgt i32 %tmp3, 2
  br i1 %cmp4, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end

if.end:                                           ; preds = %do.end, %for.cond
  %tmp5 = load i32* %j, align 4
  %cmp6 = icmp eq i32 %tmp5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  br label %for.end

if.end8:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %if.end8
  %tmp9 = load i32* %pdest, align 4
  %tmp10 = load i32* %p.addr, align 4
  %cmp11 = icmp sgt i32 %tmp9, %tmp10
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp12 = load i32* %j, align 4
  %tmp13 = load i32* %p.addr, align 4
  %cmp14 = icmp eq i32 %tmp12, %tmp13
  br i1 %cmp14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %while.body
  %tmp16 = load i32* %pdest, align 4
  %inc17 = add nsw i32 %tmp16, 1
  store i32 %inc17, i32* %pdest, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %do.body19

do.body19:                                        ; preds = %do.cond34, %while.end
  %tmp20 = load i32* %k.addr, align 4
  %idxprom = sext i32 %tmp20 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @W, i32 0, i64 %idxprom
  %tmp21 = load i32* %arrayidx, align 4
  store i32 %tmp21, i32* %D1361, align 4
  br label %do.body22

do.body22:                                        ; preds = %do.cond30, %do.body19
  %tmp23 = load i32* %D1361, align 4
  %cmp24 = icmp ne i32 %tmp23, 0
  br i1 %cmp24, label %if.then25, label %if.end29

if.then25:                                        ; preds = %do.body22
  store i32 1, i32* %pdest, align 4
  store i32 0, i32* %D1361, align 4
  %tmp26 = load i32* %k.addr, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %arrayidx28 = getelementptr inbounds [1 x i32]* @W, i32 0, i64 %idxprom27
  store i32 0, i32* %arrayidx28, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then25, %do.body22
  br label %do.cond30

do.cond30:                                        ; preds = %if.end29
  %tmp31 = load i32* %p.addr, align 4
  %cmp32 = icmp slt i32 %tmp31, 1
  br i1 %cmp32, label %do.body22, label %do.end33

do.end33:                                         ; preds = %do.cond30
  br label %do.cond34

do.cond34:                                        ; preds = %do.end33
  %tmp35 = load i32* %k.addr, align 4
  %cmp36 = icmp sgt i32 %tmp35, 0
  br i1 %cmp36, label %do.body19, label %do.end37

do.end37:                                         ; preds = %do.cond34
  br label %do.body38

do.body38:                                        ; preds = %do.cond57, %do.end37
  store i32 0, i32* %p.addr, align 4
  %tmp39 = load i32* %k.addr, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %arrayidx41 = getelementptr inbounds [1 x i32]* @Link, i32 0, i64 %idxprom40
  %tmp42 = load i32* %arrayidx41, align 4
  store i32 %tmp42, i32* %k.addr, align 4
  br label %while.cond43

while.cond43:                                     ; preds = %if.end55, %do.body38
  %tmp44 = load i32* %p.addr, align 4
  %tmp45 = load i32* %j, align 4
  %cmp46 = icmp slt i32 %tmp44, %tmp45
  br i1 %cmp46, label %while.body47, label %while.end56

while.body47:                                     ; preds = %while.cond43
  %tmp48 = load i32* %k.addr, align 4
  %cmp49 = icmp ne i32 %tmp48, -1
  br i1 %cmp49, label %if.then50, label %if.end55

if.then50:                                        ; preds = %while.body47
  %tmp51 = load i32* %pdest, align 4
  %inc52 = add nsw i32 %tmp51, 1
  store i32 %inc52, i32* %pdest, align 4
  %tmp53 = load i32* %p.addr, align 4
  %inc54 = add nsw i32 %tmp53, 1
  store i32 %inc54, i32* %p.addr, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then50, %while.body47
  br label %while.cond43

while.end56:                                      ; preds = %while.cond43
  br label %do.cond57

do.cond57:                                        ; preds = %while.end56
  %tmp58 = load i32* %k.addr, align 4
  %cmp59 = icmp ne i32 %tmp58, -1
  br i1 %cmp59, label %do.body38, label %do.end60

do.end60:                                         ; preds = %do.cond57
  store i32 1, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then7
  %tmp61 = load i32* %pdest, align 4
  ret i32 %tmp61
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i32 0, i32 2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
