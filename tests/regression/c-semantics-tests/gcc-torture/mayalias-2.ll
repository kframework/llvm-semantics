; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/mayalias-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.test = type { i16 }

define i32 @f() nounwind uwtable {
entry:
  %a = alloca i32, align 4
  %p = alloca %struct.test*, align 8
  store i32 10, i32* %a, align 4
  %0 = bitcast i32* %a to %struct.test*
  store %struct.test* %0, %struct.test** %p, align 8
  %1 = load %struct.test** %p, align 8
  %x = getelementptr inbounds %struct.test* %1, i32 0, i32 0
  store i16 1, i16* %x, align 2
  %2 = load i32* %a, align 4
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp eq i32 %call, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
