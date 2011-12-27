; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001031-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @t1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %tmp, 4100
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define i32 @t2() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32 4096, i32* %i, align 4
  call void @t1(i32 4100)
  %tmp = load i32* %i, align 4
  ret i32 %tmp
}

define void @t3(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %cmp = icmp ne i64 %tmp, 2147487743
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i64 @t4() nounwind uwtable {
entry:
  %i = alloca i64, align 8
  store i64 4096, i64* %i, align 8
  call void @t3(i64 2147487743)
  %tmp = load i64* %i, align 8
  ret i64 %tmp
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @t2()
  %cmp = icmp ne i32 %call, 4096
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @t4()
  %cmp2 = icmp ne i64 %call1, 4096
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
