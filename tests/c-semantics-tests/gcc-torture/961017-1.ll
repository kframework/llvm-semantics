; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961017-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %z = alloca i8, align 1
  store i32 0, i32* %retval
  store i8 0, i8* %z, align 1
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %0 = load i8* %z, align 1
  %dec = add i8 %0, -1
  store i8 %dec, i8* %z, align 1
  %conv = zext i8 %dec to i32
  %cmp = icmp sgt i32 %conv, 0
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @exit(i32) noreturn nounwind
