; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020716-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sub1(i32 %val) nounwind uwtable {
entry:
  %val.addr = alloca i32, align 4
  store i32 %val, i32* %val.addr, align 4
  %tmp = load i32* %val.addr, align 4
  ret i32 %tmp
}

define i32 @testcond(i32 %val) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %val.addr = alloca i32, align 4
  %flag1 = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  store i32 %val, i32* %val.addr, align 4
  %tmp = load i32* %val.addr, align 4
  store i32 %tmp, i32* %t1, align 4
  %tmp2 = load i32* %t1, align 4
  store i32 %tmp2, i32* %t2, align 4
  %tmp3 = load i32* %t2, align 4
  %call = call i32 @sub1(i32 %tmp3)
  %cmp = icmp eq i32 %call, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %flag1, align 4
  br label %lab1

lab1:                                             ; preds = %entry
  %tmp4 = load i32* %flag1, align 4
  %cmp5 = icmp ne i32 %tmp4, 0
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %lab1
  store i32 5046272, i32* %retval
  br label %return

if.else:                                          ; preds = %lab1
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @testcond(i32 1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
