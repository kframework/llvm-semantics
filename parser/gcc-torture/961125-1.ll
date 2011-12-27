; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/961125-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c":ab\00", align 1

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
  %s = alloca i8*, align 8
  %lim = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %s, align 8
  %tmp = load i8** %s, align 8
  %add.ptr = getelementptr inbounds i8* %tmp, i64 3
  store i8* %add.ptr, i8** %lim, align 8
  %tmp1 = load i8** %s, align 8
  %tmp2 = load i8** %lim, align 8
  %call = call i8* @begfield(i32 58, i8* %tmp1, i8* %tmp2, i32 1, i32 1)
  %tmp3 = load i8** %s, align 8
  %add.ptr4 = getelementptr inbounds i8* %tmp3, i64 2
  %cmp = icmp ne i8* %call, %add.ptr4
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

define internal i8* @begfield(i32 %tab, i8* %ptr, i8* %lim, i32 %sword, i32 %schar) nounwind uwtable {
entry:
  %tab.addr = alloca i32, align 4
  %ptr.addr = alloca i8*, align 8
  %lim.addr = alloca i8*, align 8
  %sword.addr = alloca i32, align 4
  %schar.addr = alloca i32, align 4
  store i32 %tab, i32* %tab.addr, align 4
  store i8* %ptr, i8** %ptr.addr, align 8
  store i8* %lim, i8** %lim.addr, align 8
  store i32 %sword, i32* %sword.addr, align 4
  store i32 %schar, i32* %schar.addr, align 4
  %tmp = load i32* %tab.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then
  %tmp1 = load i8** %ptr.addr, align 8
  %tmp2 = load i8** %lim.addr, align 8
  %cmp = icmp ult i8* %tmp1, %tmp2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %tmp3 = load i32* %sword.addr, align 4
  %dec = add nsw i32 %tmp3, -1
  store i32 %dec, i32* %sword.addr, align 4
  %tobool4 = icmp ne i32 %tmp3, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %tobool4, %land.rhs ]
  br i1 %0, label %while.body, label %while.end25

while.body:                                       ; preds = %land.end
  br label %while.cond5

while.cond5:                                      ; preds = %while.body16, %while.body
  %tmp6 = load i8** %ptr.addr, align 8
  %tmp7 = load i8** %lim.addr, align 8
  %cmp8 = icmp ult i8* %tmp6, %tmp7
  br i1 %cmp8, label %land.rhs9, label %land.end15

land.rhs9:                                        ; preds = %while.cond5
  %tmp10 = load i8** %ptr.addr, align 8
  %tmp11 = load i8* %tmp10
  %conv = sext i8 %tmp11 to i32
  %tmp12 = load i32* %tab.addr, align 4
  %cmp13 = icmp ne i32 %conv, %tmp12
  br label %land.end15

land.end15:                                       ; preds = %land.rhs9, %while.cond5
  %1 = phi i1 [ false, %while.cond5 ], [ %cmp13, %land.rhs9 ]
  br i1 %1, label %while.body16, label %while.end

while.body16:                                     ; preds = %land.end15
  %tmp17 = load i8** %ptr.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp17, i32 1
  store i8* %incdec.ptr, i8** %ptr.addr, align 8
  br label %while.cond5

while.end:                                        ; preds = %land.end15
  %tmp18 = load i8** %ptr.addr, align 8
  %tmp19 = load i8** %lim.addr, align 8
  %cmp20 = icmp ult i8* %tmp18, %tmp19
  br i1 %cmp20, label %if.then22, label %if.end

if.then22:                                        ; preds = %while.end
  %tmp23 = load i8** %ptr.addr, align 8
  %incdec.ptr24 = getelementptr inbounds i8* %tmp23, i32 1
  store i8* %incdec.ptr24, i8** %ptr.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then22, %while.end
  br label %while.cond

while.end25:                                      ; preds = %land.end
  br label %if.end28

if.else:                                          ; preds = %entry
  br label %while.body27

while.body27:                                     ; preds = %if.else, %while.body27
  br label %while.body27

if.end28:                                         ; preds = %while.end25
  %tmp29 = load i8** %ptr.addr, align 8
  %tmp30 = load i32* %schar.addr, align 4
  %idx.ext = sext i32 %tmp30 to i64
  %add.ptr = getelementptr inbounds i8* %tmp29, i64 %idx.ext
  %tmp31 = load i8** %lim.addr, align 8
  %cmp32 = icmp ule i8* %add.ptr, %tmp31
  br i1 %cmp32, label %if.then34, label %if.end39

if.then34:                                        ; preds = %if.end28
  %tmp35 = load i32* %schar.addr, align 4
  %tmp36 = load i8** %ptr.addr, align 8
  %idx.ext37 = sext i32 %tmp35 to i64
  %add.ptr38 = getelementptr inbounds i8* %tmp36, i64 %idx.ext37
  store i8* %add.ptr38, i8** %ptr.addr, align 8
  br label %if.end39

if.end39:                                         ; preds = %if.then34, %if.end28
  %tmp40 = load i8** %ptr.addr, align 8
  ret i8* %tmp40
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
