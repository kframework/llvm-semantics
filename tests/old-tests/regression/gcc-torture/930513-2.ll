; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930513-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@eq.i = internal global i32 0, align 4

define void @sub3(i32* %i) nounwind uwtable {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  ret void
}

define void @eq(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* @eq.i, align 4
  %cmp = icmp ne i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32* @eq.i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @eq.i, align 4
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  store i32 %tmp2, i32* %j, align 4
  call void (...)* bitcast (void (i32*)* @sub3 to void (...)*)(i32* %j)
  %tmp4 = load i32* %j, align 4
  store i32 %tmp4, i32* %k, align 4
  %tmp5 = load i32* %k, align 4
  %tmp6 = load i32* %k, align 4
  call void (...)* bitcast (void (i32, i32)* @eq to void (...)*)(i32 %tmp5, i32 %tmp6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
