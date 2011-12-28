; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000706-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@c = common global i32 0, align 4

define void @baz(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %tmp = load i32** %p.addr, align 8
  %tmp1 = load i32* %tmp
  store i32 %tmp1, i32* @c, align 4
  ret void
}

define void @bar(i32 %b) nounwind uwtable {
entry:
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* @c, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn

define void @foo(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  call void @baz(i32* %a.addr)
  %tmp = load i32* %b.addr, align 4
  call void @bar(i32 %tmp)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 1, i32 2)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
