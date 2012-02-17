; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr44828.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 274686410, align 4

define i32 @main() nounwind uwtable {
entry:
  %tmp1 = load i32* @a, align 4
  %conv2 = trunc i32 %tmp1 to i8
  %mul.i = mul i8 %conv2, -56
  %cmp = icmp sgt i8 %mul.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
