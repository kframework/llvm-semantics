; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr34415.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Bbb:\00", align 1

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

define i8* @foo(i8* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca i8*, align 8
  %end = alloca i8*, align 8
  %len = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i32 1, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end25, %entry
  %tmp = load i8** %p.addr, align 8
  %tmp1 = load i8* %tmp
  %conv = sext i8 %tmp1 to i32
  store i32 %conv, i32* %c, align 4
  %tmp2 = load i32* %c, align 4
  %cmp = icmp sge i32 %tmp2, 97
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.cond
  %tmp4 = load i32* %c, align 4
  %cmp5 = icmp sle i32 %tmp4, 122
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %tmp7 = load i32* %c, align 4
  %sub = sub nsw i32 %tmp7, 97
  %add = add nsw i32 %sub, 65
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.cond
  %tmp8 = load i32* %c, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %tmp8, %cond.false ]
  store i32 %cond, i32* %c, align 4
  %tmp9 = load i32* %c, align 4
  %cmp10 = icmp eq i32 %tmp9, 66
  br i1 %cmp10, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %tmp12 = load i8** %p.addr, align 8
  store i8* %tmp12, i8** %end, align 8
  br label %if.end25

if.else:                                          ; preds = %cond.end
  %tmp13 = load i32* %c, align 4
  %cmp14 = icmp eq i32 %tmp13, 65
  br i1 %cmp14, label %if.then16, label %if.else24

if.then16:                                        ; preds = %if.else
  %tmp17 = load i8** %p.addr, align 8
  store i8* %tmp17, i8** %end, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then16
  %tmp18 = load i8** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp18, i32 1
  store i8* %incdec.ptr, i8** %p.addr, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp19 = load i8** %p.addr, align 8
  %tmp20 = load i8* %tmp19
  %conv21 = sext i8 %tmp20 to i32
  %cmp22 = icmp eq i32 %conv21, 43
  br i1 %cmp22, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end

if.else24:                                        ; preds = %if.else
  br label %for.end

if.end:                                           ; preds = %do.end
  br label %if.end25

if.end25:                                         ; preds = %if.end, %if.then
  %tmp26 = load i8** %p.addr, align 8
  %incdec.ptr27 = getelementptr inbounds i8* %tmp26, i32 1
  store i8* %incdec.ptr27, i8** %p.addr, align 8
  %tmp28 = load i32* %len, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else24
  %tmp29 = load i32* %len, align 4
  %cmp30 = icmp sgt i32 %tmp29, 2
  br i1 %cmp30, label %land.lhs.true32, label %if.end40

land.lhs.true32:                                  ; preds = %for.end
  %tmp33 = load i8** %p.addr, align 8
  %tmp34 = load i8* %tmp33
  %conv35 = sext i8 %tmp34 to i32
  %cmp36 = icmp eq i32 %conv35, 58
  br i1 %cmp36, label %if.then38, label %if.end40

if.then38:                                        ; preds = %land.lhs.true32
  %tmp39 = load i8** %end, align 8
  store i8* %tmp39, i8** %p.addr, align 8
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %land.lhs.true32, %for.end
  %tmp41 = load i8** %p.addr, align 8
  ret i8* %tmp41
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %input = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** %input, align 8
  %tmp = load i8** %input, align 8
  %call = call i8* @foo(i8* %tmp)
  %tmp1 = load i8** %input, align 8
  %add.ptr = getelementptr inbounds i8* %tmp1, i64 2
  %cmp = icmp ne i8* %call, %add.ptr
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}
