; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/extzvsi.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ieee = type { i8, i8, [2 x i8], [4 x i8] }

@x = common global %struct.ieee zeroinitializer, align 4

define i32 @foo() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %exponent = alloca i32, align 4
  %0 = load i32* bitcast (%struct.ieee* @x to i32*), align 4
  %1 = lshr i32 %0, 1
  %bf.clear = and i32 %1, 2047
  store i32 %bf.clear, i32* %exponent, align 4
  %2 = load i32* %exponent, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32* %exponent, align 4
  %cmp1 = icmp ugt i32 %3, 1
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.ieee* @x to i32*), align 4
  %1 = and i32 %0, -4095
  %2 = or i32 %1, 2
  store i32 %2, i32* bitcast (%struct.ieee* @x to i32*), align 4
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
