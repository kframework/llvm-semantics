; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testGotoSkipIncompleteType.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test1() nounwind uwtable {
entry:
  %x = alloca [3 x i32], align 4
  br label %test1a

test1a:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds [3 x i32]* %x, i32 0, i64 2
  store i32 5, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [3 x i32]* %x, i32 0, i64 2
  %0 = load i32* %arrayidx1, align 4
  %cmp = icmp ne i32 5, %0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
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
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
