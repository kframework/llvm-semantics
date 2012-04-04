; ModuleID = '/home/david/src/c-semantics/tests/unitTests/gotoStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f.z = internal global i32 0, align 4
@f.y = internal global i32 0, align 4

define i32 @f() nounwind uwtable {
entry:
  %went = alloca i32, align 4
  store i32 0, i32* %went, align 4
  br label %label1

label1:                                           ; preds = %entry
  %0 = load i32* @f.z, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f.z, align 4
  br label %label2

label2:                                           ; preds = %if.then, %label1
  %1 = load i32* @f.y, align 4
  %inc1 = add nsw i32 %1, 1
  store i32 %inc1, i32* @f.y, align 4
  %2 = load i32* %went, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %label2
  store i32 1, i32* %went, align 4
  br label %label2

if.end:                                           ; preds = %label2
  %3 = load i32* @f.z, align 4
  %4 = load i32* @f.y, align 4
  %add = add nsw i32 %3, %4
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %call1 = call i32 @f()
  %call2 = call i32 @f()
  %call3 = call i32 @f()
  ret i32 %call3
}
