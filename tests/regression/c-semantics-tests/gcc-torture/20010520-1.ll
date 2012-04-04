; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010520-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@expr_hash_table_size = internal global i32 1, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %del = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %del, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32* %i, align 4
  %1 = load i32* @expr_hash_table_size, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %del, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
