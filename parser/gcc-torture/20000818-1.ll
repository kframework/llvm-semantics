; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000818-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@temporary_obstack = common global i8* null, align 8

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
  %ch = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @yylex()
  store i32 %call, i32* %ch, align 4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @yylex() nounwind uwtable {
entry:
  %ch = alloca i32, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end5, %entry
  %call = call i32 @input()
  store i32 %call, i32* %ch, align 4
  %tmp = load i32* %ch, align 4
  %call1 = call i32 @ISALNUM(i32 %tmp)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.cond
  %tmp2 = load i32* %ch, align 4
  call void @obstack_1grow(i8** @temporary_obstack, i32 %tmp2)
  br label %if.end5

if.else:                                          ; preds = %for.cond
  %tmp3 = load i32* %ch, align 4
  %cmp = icmp ne i32 %tmp3, 95
  br i1 %cmp, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  br label %for.end

if.end:                                           ; preds = %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  br label %for.cond

for.end:                                          ; preds = %if.then4
  %tmp6 = load i32* %ch, align 4
  ret i32 %tmp6
}

declare void @exit(i32) noreturn nounwind

define internal i32 @input() nounwind uwtable {
entry:
  ret i32 0
}

define internal i32 @ISALNUM(i32 %ch) nounwind uwtable {
entry:
  %ch.addr = alloca i32, align 4
  store i32 %ch, i32* %ch.addr, align 4
  %tmp = load i32* %ch.addr, align 4
  %cmp = icmp sge i32 %tmp, 65
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %tmp1 = load i32* %ch.addr, align 4
  %cmp2 = icmp sle i32 %tmp1, 90
  br i1 %cmp2, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %tmp3 = load i32* %ch.addr, align 4
  %cmp4 = icmp sge i32 %tmp3, 97
  br i1 %cmp4, label %land.lhs.true5, label %lor.rhs

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %ch.addr, align 4
  %cmp7 = icmp sle i32 %tmp6, 122
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  %tmp8 = load i32* %ch.addr, align 4
  %cmp9 = icmp sge i32 %tmp8, 48
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %tmp10 = load i32* %ch.addr, align 4
  %cmp11 = icmp sle i32 %tmp10, 48
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %0 = phi i1 [ false, %lor.rhs ], [ %cmp11, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true5, %land.lhs.true
  %1 = phi i1 [ true, %land.lhs.true5 ], [ true, %land.lhs.true ], [ %0, %land.end ]
  %lor.ext = zext i1 %1 to i32
  ret i32 %lor.ext
}

define internal void @obstack_1grow(i8** %ptr, i32 %ch) nounwind uwtable {
entry:
  %ptr.addr = alloca i8**, align 8
  %ch.addr = alloca i32, align 4
  store i8** %ptr, i8*** %ptr.addr, align 8
  store i32 %ch, i32* %ch.addr, align 4
  ret void
}
