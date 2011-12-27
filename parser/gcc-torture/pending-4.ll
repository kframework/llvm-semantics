; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pending-4.c'
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

define void @dummy(i32* %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %number_columns = alloca i32, align 4
  %cnt0 = alloca i32, align 4
  %cnt1 = alloca i32, align 4
  %i = alloca i32, align 4
  %A1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 9, i32* %number_columns, align 4
  store i32 0, i32* %cnt0, align 4
  store i32 0, i32* %cnt1, align 4
  %tmp = load i32* %number_columns, align 4
  %sub = sub nsw i32 %tmp, 1
  store i32 %sub, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp ne i32 %tmp1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %cmp3 = icmp eq i32 %tmp2, 1
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  call void (...)* bitcast (void (i32*, i32)* @dummy to void (...)*)(i32* %A1, i32 %tmp4)
  %tmp5 = load i32* %cnt0, align 4
  %inc = add nsw i32 %tmp5, 1
  store i32 %inc, i32* %cnt0, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %tmp6 = load i32* %i, align 4
  %sub7 = sub nsw i32 %tmp6, 1
  call void (...)* bitcast (void (i32*, i32)* @dummy to void (...)*)(i32* %A1, i32 %sub7)
  %tmp8 = load i32* %cnt1, align 4
  %inc9 = add nsw i32 %tmp8, 1
  store i32 %inc9, i32* %cnt1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp10 = load i32* %i, align 4
  %dec = add nsw i32 %tmp10, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp11 = load i32* %cnt0, align 4
  %cmp12 = icmp ne i32 %tmp11, 1
  br i1 %cmp12, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %tmp13 = load i32* %cnt1, align 4
  %cmp14 = icmp ne i32 %tmp13, 7
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %lor.lhs.false, %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
