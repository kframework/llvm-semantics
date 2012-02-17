; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr44202-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @add512(i32 %a, i32* %b) nounwind uwtable noinline {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32*, align 8
  %c = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32* %b, i32** %b.addr, align 8
  %tmp = load i32* %a.addr, align 4
  %add = add nsw i32 %tmp, 512
  store i32 %add, i32* %c, align 4
  %tmp1 = load i32* %c, align 4
  %cmp = icmp ne i32 %tmp1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %a.addr, align 4
  %tmp3 = load i32** %b.addr, align 8
  store i32 %tmp2, i32* %tmp3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp4 = load i32* %c, align 4
  ret i32 %tmp4
}

define i32 @add513(i32 %a, i32* %b) nounwind uwtable noinline {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32*, align 8
  %c = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32* %b, i32** %b.addr, align 8
  %tmp = load i32* %a.addr, align 4
  %add = add nsw i32 %tmp, 513
  store i32 %add, i32* %c, align 4
  %tmp1 = load i32* %c, align 4
  %cmp = icmp eq i32 %tmp1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %a.addr, align 4
  %tmp3 = load i32** %b.addr, align 8
  store i32 %tmp2, i32* %tmp3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp4 = load i32* %c, align 4
  ret i32 %tmp4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b0 = alloca i32, align 4
  %b1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* %b0, align 4
  store i32 -1, i32* %b1, align 4
  %call = call i32 @add512(i32 -512, i32* %b0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp = load i32* %b0, align 4
  %cmp1 = icmp ne i32 %tmp, -1
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %call3 = call i32 @add513(i32 -513, i32* %b1)
  %cmp4 = icmp ne i32 %call3, 0
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false2
  %tmp6 = load i32* %b1, align 4
  %cmp7 = icmp ne i32 %tmp6, -513
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
