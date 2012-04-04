; ModuleID = '/home/david/src/c-semantics/tests/unitTests/prime.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @prime(i32 2)
  %call1 = call i32 @prime(i32 7)
  %add = add nsw i32 %call, %call1
  %call2 = call i32 @prime(i32 8)
  %add3 = add nsw i32 %add, %call2
  %call4 = call i32 @prime(i32 31)
  %add5 = add nsw i32 %add3, %call4
  ret i32 %add5
}

define i32 @prime(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %flag = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 1, i32* %flag, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %div = sdiv i32 %1, 2
  %cmp = icmp slt i32 %0, %div
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i32* %flag, align 4
  %tobool = icmp ne i32 %2, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %3 = phi i1 [ false, %for.cond ], [ %tobool, %land.rhs ]
  br i1 %3, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %i, align 4
  %rem = srem i32 %4, %5
  %cmp1 = icmp eq i32 %rem, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 0, i32* %flag, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.cond

for.end:                                          ; preds = %land.end
  %7 = load i32* %flag, align 4
  %tobool2 = icmp ne i32 %7, 0
  br i1 %tobool2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %for.end
  store i32 1, i32* %retval
  br label %return

if.else4:                                         ; preds = %for.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32* %retval
  ret i32 %8
}
