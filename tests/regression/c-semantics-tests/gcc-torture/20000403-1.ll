; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000403-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@aa = global [1 x i64] [i64 9223372036854771713], align 8
@bb = global [1 x i64] [i64 9223372036854771713], align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i64* getelementptr inbounds ([1 x i64]* @aa, i32 0, i32 0), align 8
  %1 = load i64* getelementptr inbounds ([1 x i64]* @bb, i32 0, i32 0), align 8
  %call = call i32 @seqgt(i64 %0, i16 zeroext 4096, i64 %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %2 = load i64* getelementptr inbounds ([1 x i64]* @aa, i32 0, i32 0), align 8
  %3 = load i64* getelementptr inbounds ([1 x i64]* @bb, i32 0, i32 0), align 8
  %call1 = call i32 @seqgt2(i64 %2, i16 zeroext 4096, i64 %3)
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

define i32 @seqgt(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  %win.addr = alloca i16, align 2
  %b.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i16 %win, i16* %win.addr, align 2
  store i64 %b, i64* %b.addr, align 8
  %0 = load i64* %a.addr, align 8
  %1 = load i16* %win.addr, align 2
  %conv = zext i16 %1 to i64
  %add = add i64 %0, %conv
  %2 = load i64* %b.addr, align 8
  %sub = sub i64 %add, %2
  %cmp = icmp sgt i64 %sub, 0
  %conv1 = zext i1 %cmp to i32
  ret i32 %conv1
}

define i32 @seqgt2(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  %win.addr = alloca i16, align 2
  %b.addr = alloca i64, align 8
  %l = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i16 %win, i16* %win.addr, align 2
  store i64 %b, i64* %b.addr, align 8
  %0 = load i64* %a.addr, align 8
  %1 = load i16* %win.addr, align 2
  %conv = zext i16 %1 to i64
  %add = add i64 %0, %conv
  %2 = load i64* %b.addr, align 8
  %sub = sub i64 %add, %2
  store i64 %sub, i64* %l, align 8
  %3 = load i64* %l, align 8
  %cmp = icmp sgt i64 %3, 0
  %conv1 = zext i1 %cmp to i32
  ret i32 %conv1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
