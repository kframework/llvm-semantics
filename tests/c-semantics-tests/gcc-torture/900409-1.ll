; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/900409-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f1(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64* %a.addr, align 8
  %and = and i64 %0, 4278190080
  ret i64 %and
}

define i64 @f2(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64* %a.addr, align 8
  %and = and i64 %0, -4278190081
  ret i64 %and
}

define i64 @f3(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64* %a.addr, align 8
  %and = and i64 %0, 255
  ret i64 %and
}

define i64 @f4(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64* %a.addr, align 8
  %and = and i64 %0, -256
  ret i64 %and
}

define i64 @f5(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64* %a.addr, align 8
  %and = and i64 %0, 65535
  ret i64 %and
}

define i64 @f6(i64 %a) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  %0 = load i64* %a.addr, align 8
  %and = and i64 %0, -65536
  ret i64 %and
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 2309737967, i64* %a, align 8
  %0 = load i64* %a, align 8
  %call = call i64 @f1(i64 %0)
  %cmp = icmp ne i64 %call, 2298478592
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %a, align 8
  %call1 = call i64 @f2(i64 %1)
  %cmp2 = icmp ne i64 %call1, 11259375
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %2 = load i64* %a, align 8
  %call4 = call i64 @f3(i64 %2)
  %cmp5 = icmp ne i64 %call4, 239
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %3 = load i64* %a, align 8
  %call7 = call i64 @f4(i64 %3)
  %cmp8 = icmp ne i64 %call7, 2309737728
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %4 = load i64* %a, align 8
  %call10 = call i64 @f5(i64 %4)
  %cmp11 = icmp ne i64 %call10, 52719
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %5 = load i64* %a, align 8
  %call13 = call i64 @f6(i64 %5)
  %cmp14 = icmp ne i64 %call13, 2309685248
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false12
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
