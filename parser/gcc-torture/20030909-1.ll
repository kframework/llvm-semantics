; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030909-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @test(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @foo(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %y.addr, align 4
  %cmp = icmp eq i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %a

if.else:                                          ; preds = %entry
  br label %a

a:                                                ; preds = %if.else, %if.then
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %y.addr, align 4
  %cmp4 = icmp eq i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %a
  br label %b

if.else6:                                         ; preds = %a
  br label %b

b:                                                ; preds = %if.else6, %if.then5
  %tmp7 = load i32* %x.addr, align 4
  %tmp8 = load i32* %y.addr, align 4
  %cmp9 = icmp ne i32 %tmp7, %tmp8
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %b
  %tmp11 = load i32* %x.addr, align 4
  %tmp12 = load i32* %y.addr, align 4
  call void @test(i32 %tmp11, i32 %tmp12)
  br label %if.end

if.end:                                           ; preds = %if.then10, %b
  br label %if.end13

if.end13:                                         ; preds = %if.end
  br label %if.end14

if.end14:                                         ; preds = %if.end13
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 0, i32 0)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
