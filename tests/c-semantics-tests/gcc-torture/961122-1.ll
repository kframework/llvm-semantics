; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961122-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@acc = common global i64 0, align 8

define void @addhi(i16 signext %a) nounwind uwtable {
entry:
  %a.addr = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  %0 = load i16* %a.addr, align 2
  %conv = sext i16 %0 to i64
  %shl = shl i64 %conv, 32
  %1 = load i64* @acc, align 8
  %add = add nsw i64 %1, %shl
  store i64 %add, i64* @acc, align 8
  ret void
}

define void @subhi(i16 signext %a) nounwind uwtable {
entry:
  %a.addr = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  %0 = load i16* %a.addr, align 2
  %conv = sext i16 %0 to i64
  %shl = shl i64 %conv, 32
  %1 = load i64* @acc, align 8
  %sub = sub nsw i64 %1, %shl
  store i64 %sub, i64* @acc, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 281470681743360, i64* @acc, align 8
  call void @addhi(i16 signext 1)
  %0 = load i64* @acc, align 8
  %cmp = icmp ne i64 %0, 281474976710656
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @subhi(i16 signext 1)
  %1 = load i64* @acc, align 8
  %cmp1 = icmp ne i64 %1, 281470681743360
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
