; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %u = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64* %x.addr, align 8
  %shr = lshr i64 %1, 32
  %conv = trunc i64 %shr to i32
  store i32 %conv, i32* %u, align 4
  %2 = load i32* %u, align 4
  store i32 %2, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32* %retval
  ret i32 %3
}

define i64 @bar(i16 zeroext %x) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = zext i16 %0 to i64
  %shl = shl i64 %conv, 32
  ret i64 %shl
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i64 0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @foo(i64 4294967295)
  %cmp2 = icmp ne i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @foo(i64 163192045312)
  %cmp6 = icmp ne i32 %call5, 37
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i64 @bar(i16 zeroext 0)
  %cmp10 = icmp ne i64 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i64 @bar(i16 zeroext 37)
  %cmp14 = icmp ne i64 %call13, 158913789952
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  ret i32 0
}

declare void @abort() noreturn nounwind
