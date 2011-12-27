; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i16* null, align 8

define i64 @foo(i16* %p) nounwind uwtable {
entry:
  %p.addr = alloca i16*, align 8
  %b = alloca i64, align 8
  store i16* %p, i16** %p.addr, align 8
  %tmp = load i16** %p.addr, align 8
  %tmp1 = load i16* %tmp
  %conv = sext i16 %tmp1 to i64
  store i64 %conv, i64* %b, align 8
  %tmp2 = load i16** %p.addr, align 8
  %add.ptr = getelementptr inbounds i16* %tmp2, i64 1
  store i16* %add.ptr, i16** @q, align 8
  %tmp3 = load i64* %b, align 8
  ret i64 %tmp3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i16, align 2
  store i32 0, i32* %retval
  store i16 -256, i16* %a, align 2
  %call = call i64 @foo(i16* %a)
  %cmp = icmp ne i64 %call, -256
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
