; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo() nounwind uwtable {
entry:
  %C = alloca i64, align 8
  %X = alloca i64, align 8
  %Y = alloca i32, align 4
  store i64 -9223372036854775808, i64* %C, align 8
  store i32 32, i32* %Y, align 4
  %tmp = load i64* %C, align 8
  %tmp1 = load i32* %Y, align 4
  %and = and i32 %tmp1, 31
  %sh_prom = zext i32 %and to i64
  %shr = ashr i64 %tmp, %sh_prom
  store i64 %shr, i64* %X, align 8
  %tmp2 = load i64* %X, align 8
  ret i64 %tmp2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @foo()
  %cmp = icmp ne i64 %call, -9223372036854775808
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
