; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/compare-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test1(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp ne i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.end

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
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp sgt i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.end

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
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %y.addr, align 4
  %3 = load i32* %x.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.end

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
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp ne i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

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
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

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
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp sle i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %y.addr, align 4
  %3 = load i32* %x.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

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
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  call void @test1(i32 %0, i32 %1)
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  call void @test2(i32 %2, i32 %3)
  %4 = load i32* %x.addr, align 4
  %5 = load i32* %y.addr, align 4
  call void @test3(i32 %4, i32 %5)
  %6 = load i32* %x.addr, align 4
  %7 = load i32* %y.addr, align 4
  call void @test4(i32 %6, i32 %7)
  %8 = load i32* %x.addr, align 4
  %9 = load i32* %y.addr, align 4
  call void @test5(i32 %8, i32 %9)
  %10 = load i32* %x.addr, align 4
  %11 = load i32* %y.addr, align 4
  call void @test6(i32 %10, i32 %11)
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
