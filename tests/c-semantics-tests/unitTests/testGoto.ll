; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testGoto.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test1() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  store i32 0, i32* %x, align 4
  br label %test1a

test1a:                                           ; preds = %entry
  %0 = load i32* %x, align 4
  ret i32 %0
}

define i32 @test2() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %x, align 4
  br label %test2a

test2a:                                           ; preds = %entry
  store i32 5, i32* %y, align 4
  %0 = load i32* %y, align 4
  %1 = load i32* %x, align 4
  %cmp = icmp eq i32 %0, %1
  %conv = zext i1 %cmp to i32
  %mul = mul nsw i32 2, %conv
  ret i32 %mul
}

define i32 @test3() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 2, i32* %x, align 4
  br label %test3a

test3a:                                           ; preds = %entry
  store i32 2, i32* %y, align 4
  %0 = load i32* %y, align 4
  %1 = load i32* %x, align 4
  %sub = sub nsw i32 %0, %1
  ret i32 %sub
}

define i32 @test4() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %w = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %x, align 4
  store i32 1, i32* %y, align 4
  store i32 0, i32* %w, align 4
  br label %test4a

test4a:                                           ; preds = %entry
  store i32 5, i32* %z, align 4
  %0 = load i32* %z, align 4
  %1 = load i32* %y, align 4
  %sub = sub nsw i32 %0, %1
  %cmp = icmp ne i32 %sub, 4
  %conv = zext i1 %cmp to i32
  %mul = mul nsw i32 4, %conv
  ret i32 %mul
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test1()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @test2()
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @test3()
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  store i32 3, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @test4()
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  store i32 4, i32* %retval
  br label %return

if.end12:                                         ; preds = %if.end8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end12, %if.then11, %if.then7, %if.then3, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
