; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/bitfld-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global { i8, i8, i8, i8 } { i8 -123, i8 -113, i8 -29, i8 -1 }, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast ({ i8, i8, i8, i8 }* @x to i32*), align 4
  %bf.clear = and i32 %0, 4095
  %1 = shl i32 %bf.clear, 20
  %bf.val.sext = ashr i32 %1, 20
  %cmp = icmp ne i32 %bf.val.sext, -123
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* bitcast ({ i8, i8, i8, i8 }* @x to i32*), align 4
  %3 = lshr i32 %2, 12
  %bf.clear1 = and i32 %3, 1048575
  %4 = shl i32 %bf.clear1, 12
  %bf.val.sext2 = ashr i32 %4, 12
  %cmp3 = icmp ne i32 %bf.val.sext2, -456
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn nounwind
