; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr38212.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32* noalias %p, i32 %i) nounwind uwtable noinline {
entry:
  %p.addr = alloca i32*, align 8
  %i.addr = alloca i32, align 4
  %q = alloca i32*, align 8
  %r = alloca i32*, align 8
  %v = alloca i32, align 4
  %w = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32** %p.addr, align 8
  %add.ptr = getelementptr inbounds i32* %tmp, i64 1
  store i32* %add.ptr, i32** %q, align 8
  %tmp1 = load i32** %q, align 8
  %tmp2 = load i32* %i.addr, align 4
  %idx.ext = sext i32 %tmp2 to i64
  %sub.ptr.neg = sub i64 0, %idx.ext
  %sub.ptr = getelementptr inbounds i32* %tmp1, i64 %sub.ptr.neg
  store i32* %sub.ptr, i32** %r, align 8
  %tmp3 = load i32** %r, align 8
  %tmp4 = load i32* %tmp3
  store i32 %tmp4, i32* %v, align 4
  %tmp5 = load i32** %p.addr, align 8
  store i32 1, i32* %tmp5
  %tmp6 = load i32** %r, align 8
  %tmp7 = load i32* %tmp6
  store i32 %tmp7, i32* %w, align 4
  %tmp8 = load i32* %v, align 4
  %tmp9 = load i32* %w, align 4
  %add = add nsw i32 %tmp8, %tmp9
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  %call = call i32 @foo(i32* %i, i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
