; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931017-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4

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
  store i32 0, i32* %retval
  call void @f()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind

define i32 @h1() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @h2(i32* %e) nounwind uwtable {
entry:
  %e.addr = alloca i32*, align 8
  store i32* %e, i32** %e.addr, align 8
  %tmp = load i32** %e.addr, align 8
  %cmp = icmp ne i32* %tmp, @v
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @g(i8* %c) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %c, i8** %c.addr, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %call = call i32 @h1()
  store i32 %call, i32* %i, align 4
  %tmp = load i32* %i, align 4
  %cmp = icmp eq i32 %tmp, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  store i32 0, i32* %retval
  br label %return

if.else:                                          ; preds = %do.body
  %tmp1 = load i32* %i, align 4
  %cmp2 = icmp eq i32 %tmp1, 1
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %call4 = call i32 @h1()
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end
  br label %do.cond

do.cond:                                          ; preds = %if.end5
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp eq i32 %tmp6, 1
  br i1 %cmp7, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %do.body8

do.body8:                                         ; preds = %do.cond10, %do.end
  %call9 = call i32 (...)* bitcast (i32 (i32*)* @h2 to i32 (...)*)(i32* @v)
  store i32 %call9, i32* %b, align 4
  br label %do.cond10

do.cond10:                                        ; preds = %do.body8
  %tmp11 = load i32* %i, align 4
  %cmp12 = icmp eq i32 %tmp11, 5
  br i1 %cmp12, label %do.body8, label %do.end13

do.end13:                                         ; preds = %do.cond10
  %tmp14 = load i32* %i, align 4
  %cmp15 = icmp ne i32 %tmp14, 2
  br i1 %cmp15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %do.end13
  %tmp17 = load i32* %b, align 4
  store i32 %tmp17, i32* %retval
  br label %return

if.end18:                                         ; preds = %do.end13
  %tmp19 = load i8** %c.addr, align 8
  store i8 97, i8* %tmp19
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end18, %if.then16, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define void @f() nounwind uwtable {
entry:
  %c = alloca i8, align 1
  %call = call i32 (...)* bitcast (i32 (i8*)* @g to i32 (...)*)(i8* %c)
  ret void
}
