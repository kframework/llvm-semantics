; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930622-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4
@b = common global i32 0, align 4

define i32 @g() nounwind uwtable {
entry:
  ret i32 0
}

define void @h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  ret void
}

define i32 @f() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %call = call i32 @g()
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @g()
  store i32 %call1, i32* @a, align 4
  %tmp = load i32* @b, align 4
  %cmp2 = icmp sge i32 %tmp, 1
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %tmp4 = load i32* @a, align 4
  call void (...)* bitcast (void (i32)* @h to void (...)*)(i32 %tmp4)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %tmp = load i32* @a, align 4
  %cmp = icmp ne i32 %tmp, 0
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
