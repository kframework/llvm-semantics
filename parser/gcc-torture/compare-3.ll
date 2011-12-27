; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/compare-3.c'
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

define void @test1(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp ne i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @link_error0()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

define void @test2(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp sgt i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @link_error0()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

define void @test3(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %tmp2 = load i32* %y.addr, align 4
  %tmp3 = load i32* %x.addr, align 4
  %cmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @link_error0()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

define void @test4(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp ne i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  call void @link_error1()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @test5(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp sge i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  call void @link_error1()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @test6(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp sle i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %y.addr, align 4
  %tmp3 = load i32* %x.addr, align 4
  %cmp4 = icmp slt i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  call void @link_error1()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @all_tests(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  call void @test1(i32 %tmp, i32 %tmp1)
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  call void @test2(i32 %tmp2, i32 %tmp3)
  %tmp4 = load i32* %x.addr, align 4
  %tmp5 = load i32* %y.addr, align 4
  call void @test3(i32 %tmp4, i32 %tmp5)
  %tmp6 = load i32* %x.addr, align 4
  %tmp7 = load i32* %y.addr, align 4
  call void @test4(i32 %tmp6, i32 %tmp7)
  %tmp8 = load i32* %x.addr, align 4
  %tmp9 = load i32* %y.addr, align 4
  call void @test5(i32 %tmp8, i32 %tmp9)
  %tmp10 = load i32* %x.addr, align 4
  %tmp11 = load i32* %y.addr, align 4
  call void @test6(i32 %tmp10, i32 %tmp11)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @all_tests(i32 0, i32 0)
  call void @all_tests(i32 1, i32 2)
  call void @all_tests(i32 4, i32 3)
  ret i32 0
}

define void @link_error0() nounwind uwtable {
entry:
  ret void
}

define void @link_error1() nounwind uwtable {
entry:
  ret void
}
