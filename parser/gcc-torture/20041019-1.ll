; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041019-1.c'
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

define i32 @test_store_ccp(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %a, i32** %p, align 8
  br label %if.end5

if.else:                                          ; preds = %entry
  %tmp1 = load i32* %i.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 8
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  store i32* %b, i32** %p, align 8
  br label %if.end

if.else4:                                         ; preds = %if.else
  store i32* %c, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else4, %if.then3
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %tmp6 = load i32** %p, align 8
  store i32 10, i32* %tmp6
  store i32 3, i32* %b, align 4
  %tmp7 = load i32** %p, align 8
  %tmp8 = load i32* %tmp7
  %add = add nsw i32 %tmp8, 2
  ret i32 %add
}

define i32 @test_store_copy_prop(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %a, i32** %p, align 8
  br label %if.end5

if.else:                                          ; preds = %entry
  %tmp1 = load i32* %i.addr, align 4
  %cmp2 = icmp sgt i32 %tmp1, 8
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  store i32* %b, i32** %p, align 8
  br label %if.end

if.else4:                                         ; preds = %if.else
  store i32* %c, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else4, %if.then3
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %tmp6 = load i32* %i.addr, align 4
  %tmp7 = load i32** %p, align 8
  store i32 %tmp6, i32* %tmp7
  %tmp8 = load i32* %i.addr, align 4
  %add = add nsw i32 %tmp8, 1
  store i32 %add, i32* %b, align 4
  %tmp9 = load i32** %p, align 8
  %tmp10 = load i32* %tmp9
  ret i32 %tmp10
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test_store_ccp(i32 10)
  store i32 %call, i32* %x, align 4
  %tmp = load i32* %x, align 4
  %cmp = icmp eq i32 %tmp, 12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @test_store_copy_prop(i32 9)
  store i32 %call1, i32* %x, align 4
  %tmp2 = load i32* %x, align 4
  %cmp3 = icmp eq i32 %tmp2, 9
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
