; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020911-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@c = global i16 -32768, align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i16* @c, align 2
  %conv = zext i16 %0 to i32
  %sub = sub nsw i32 %conv, 32768
  %cmp = icmp slt i32 %sub, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i16* @c, align 2
  %conv2 = zext i16 %1 to i32
  %sub3 = sub nsw i32 %conv2, 32768
  %cmp4 = icmp sgt i32 %sub3, 32767
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @abort() noreturn nounwind
