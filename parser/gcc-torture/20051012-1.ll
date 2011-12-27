; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051012-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32*, i64 }
%struct.type = type { i32*, [2 x i8], [2 x i8] }

@t = common global %struct.type zeroinitializer, align 8

define i32 @foo(i32* %q.coerce0, i64 %q.coerce1) nounwind uwtable {
entry:
  %q = alloca %struct.type, align 8
  %0 = bitcast %struct.type* %q to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i32* %q.coerce0, i32** %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i64 %q.coerce1, i64* %2
  %3 = load i32* bitcast (i8* getelementptr (i8* bitcast (%struct.type* @t to i8*), i32 8) to i32*), align 8
  %4 = lshr i32 %3, 16
  %bf.clear = and i32 %4, 511
  ret i32 %bf.clear
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (i8* getelementptr (i8* bitcast (%struct.type* @t to i8*), i32 8) to i32*), align 8
  %1 = and i32 %0, -33488897
  %2 = or i32 %1, 524288
  store i32 %2, i32* bitcast (i8* getelementptr (i8* bitcast (%struct.type* @t to i8*), i32 8) to i32*), align 8
  %3 = load i32** getelementptr (%0* bitcast (%struct.type* @t to %0*), i32 0, i32 0), align 1
  %4 = load i64* getelementptr (%0* bitcast (%struct.type* @t to %0*), i32 0, i32 1), align 1
  %call = call i32 @foo(i32* %3, i64 %4)
  %cmp = icmp ne i32 %call, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
