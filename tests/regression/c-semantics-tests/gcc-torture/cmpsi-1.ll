; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/cmpsi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1(i32 %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @dummy()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32* %y.addr, align 4
  %2 = load i32* %x.addr, align 4
  %sub = sub i32 %2, %1
  store i32 %sub, i32* %x.addr, align 4
  %3 = load i32* %x.addr, align 4
  %cmp1 = icmp ult i32 %3, -2147483648
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %4 = load i32* %x.addr, align 4
  ret i32 %4
}

declare void @abort() noreturn nounwind

define i32 @f2(i64 %x, i64 %y) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @dummy()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i64* %y.addr, align 8
  %2 = load i64* %x.addr, align 8
  %sub = sub i64 %2, %1
  store i64 %sub, i64* %x.addr, align 8
  %3 = load i64* %x.addr, align 8
  %cmp1 = icmp ult i64 %3, -9223372036854775808
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %4 = load i64* %x.addr, align 8
  %conv = trunc i64 %4 to i32
  ret i32 %conv
}

define void @dummy() nounwind uwtable {
entry:
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f1(i32 2147483635, i32 -2147483647)
  %call1 = call i32 @f2(i64 9223372036854775795, i64 -9223372036854775807)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
