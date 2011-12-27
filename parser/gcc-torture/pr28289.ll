; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr28289.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@one = global i32 1, align 4

define void @ix86_split_ashr(i32 %mode) nounwind uwtable {
entry:
  %mode.addr = alloca i32, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %tmp = load i32* %mode.addr, align 4
  %cmp = icmp ne i32 %tmp, 0
  %cond = select i1 %cmp, i32 (i32)* @ok, i32 (i32)* @gen_x86_64_shrd
  %call = call i32 %cond(i32 0)
  ret void
}

define i32 @ok(i32 %i) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  call void @exit(i32 %tmp) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @gen_x86_64_shrd(i32 %a) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = volatile load i32* @one, align 4
  call void @ix86_split_ashr(i32 %tmp)
  ret i32 1
}

declare void @exit(i32) noreturn
