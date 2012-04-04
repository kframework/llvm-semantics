; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931031-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i8, [3 x i8], [4 x i8] }

define i32 @f(i64 %x.coerce) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.foo, align 8
  %t = alloca i32, align 4
  %0 = bitcast %struct.foo* %x to i64*
  store i64 %x.coerce, i64* %0, align 1
  %1 = bitcast %struct.foo* %x to i8*
  %bf.field.offs = getelementptr i8* %1, i32 4
  %2 = bitcast i8* %bf.field.offs to i32*
  %3 = load i32* %2, align 4
  store i32 %3, i32* %t, align 4
  %4 = load i32* %t, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i32* %t, align 4
  %add = add nsw i32 %5, 1
  store i32 %add, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32* %retval
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.foo, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.foo* %x to i8*
  %bf.field.offs = getelementptr i8* %0, i32 4
  %1 = bitcast i8* %bf.field.offs to i32*
  store i32 -1, i32* %1, align 4
  %2 = bitcast %struct.foo* %x to i64*
  %3 = load i64* %2, align 1
  %call = call i32 (...)* bitcast (i32 (i64)* @f to i32 (...)*)(i64 %3)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
