; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020503-1.c'
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
  %buf = alloca [128 x i8], align 16
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [128 x i8]* %buf, i32 0, i32 0
  %call = call i8* @inttostr(i64 -1, i8* %arraydecay)
  store i8* %call, i8** %p, align 8
  %tmp = load i8** %p, align 8
  %tmp1 = load i8* %tmp
  %conv = sext i8 %tmp1 to i32
  %cmp = icmp ne i32 %conv, 45
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal i8* @inttostr(i64 %i, i8* %buf) nounwind uwtable {
entry:
  %i.addr = alloca i64, align 8
  %buf.addr = alloca i8*, align 8
  %ui = alloca i64, align 8
  %p = alloca i8*, align 8
  store i64 %i, i64* %i.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  %tmp = load i64* %i.addr, align 8
  store i64 %tmp, i64* %ui, align 8
  %tmp2 = load i8** %buf.addr, align 8
  %add.ptr = getelementptr inbounds i8* %tmp2, i64 127
  store i8* %add.ptr, i8** %p, align 8
  %tmp3 = load i8** %p, align 8
  store i8 0, i8* %tmp3
  %tmp4 = load i64* %i.addr, align 8
  %cmp = icmp slt i64 %tmp4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp5 = load i64* %ui, align 8
  %sub = sub i64 0, %tmp5
  store i64 %sub, i64* %ui, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %tmp6 = load i64* %ui, align 8
  %rem = urem i64 %tmp6, 10
  %add = add i64 48, %rem
  %conv = trunc i64 %add to i8
  %tmp7 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp7, i32 -1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 %conv, i8* %incdec.ptr
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %tmp8 = load i64* %ui, align 8
  %div = udiv i64 %tmp8, 10
  store i64 %div, i64* %ui, align 8
  %cmp9 = icmp ne i64 %div, 0
  br i1 %cmp9, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %tmp11 = load i64* %i.addr, align 8
  %cmp12 = icmp slt i64 %tmp11, 0
  br i1 %cmp12, label %if.then14, label %if.end17

if.then14:                                        ; preds = %do.end
  %tmp15 = load i8** %p, align 8
  %incdec.ptr16 = getelementptr inbounds i8* %tmp15, i32 -1
  store i8* %incdec.ptr16, i8** %p, align 8
  store i8 45, i8* %incdec.ptr16
  br label %if.end17

if.end17:                                         ; preds = %if.then14, %do.end
  %tmp18 = load i8** %p, align 8
  ret i8* %tmp18
}

declare void @abort() noreturn nounwind
