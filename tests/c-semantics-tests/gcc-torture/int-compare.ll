; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/int-compare.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gt(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %b.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ge(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %b.addr, align 4
  %cmp = icmp sge i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @lt(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %b.addr, align 4
  %cmp = icmp slt i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @le(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %b.addr, align 4
  %cmp = icmp sle i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define void @true(i32 %c) nounwind uwtable {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32* %c.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @false(i32 %c) nounwind uwtable {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32* %c.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f() nounwind uwtable {
entry:
  %call = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 2, i32 1)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call)
  %call1 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 1, i32 2)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call1)
  %call2 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 2147483647, i32 0)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call2)
  %call3 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 0, i32 2147483647)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call3)
  %call4 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 2147483647, i32 1)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call4)
  %call5 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 1, i32 2147483647)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call5)
  %call6 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 -2147483648, i32 0)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call6)
  %call7 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 0, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call7)
  %call8 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 -2147483648, i32 1)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call8)
  %call9 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 1, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call9)
  %call10 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 2147483647, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call10)
  %call11 = call i32 (...)* bitcast (i32 (i32, i32)* @gt to i32 (...)*)(i32 -2147483648, i32 2147483647)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call11)
  %call12 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 2, i32 1)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call12)
  %call13 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 1, i32 2)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call13)
  %call14 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 2147483647, i32 0)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call14)
  %call15 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 0, i32 2147483647)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call15)
  %call16 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 2147483647, i32 1)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call16)
  %call17 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 1, i32 2147483647)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call17)
  %call18 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 -2147483648, i32 0)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call18)
  %call19 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 0, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call19)
  %call20 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 -2147483648, i32 1)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call20)
  %call21 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 1, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call21)
  %call22 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 2147483647, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call22)
  %call23 = call i32 (...)* bitcast (i32 (i32, i32)* @ge to i32 (...)*)(i32 -2147483648, i32 2147483647)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call23)
  %call24 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 2, i32 1)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call24)
  %call25 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 1, i32 2)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call25)
  %call26 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 2147483647, i32 0)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call26)
  %call27 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 0, i32 2147483647)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call27)
  %call28 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 2147483647, i32 1)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call28)
  %call29 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 1, i32 2147483647)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call29)
  %call30 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 -2147483648, i32 0)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call30)
  %call31 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 0, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call31)
  %call32 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 -2147483648, i32 1)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call32)
  %call33 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 1, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call33)
  %call34 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 2147483647, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call34)
  %call35 = call i32 (...)* bitcast (i32 (i32, i32)* @lt to i32 (...)*)(i32 -2147483648, i32 2147483647)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call35)
  %call36 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 2, i32 1)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call36)
  %call37 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 1, i32 2)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call37)
  %call38 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 2147483647, i32 0)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call38)
  %call39 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 0, i32 2147483647)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call39)
  %call40 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 2147483647, i32 1)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call40)
  %call41 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 1, i32 2147483647)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call41)
  %call42 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 -2147483648, i32 0)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call42)
  %call43 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 0, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call43)
  %call44 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 -2147483648, i32 1)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call44)
  %call45 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 1, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call45)
  %call46 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 2147483647, i32 -2147483648)
  call void (...)* bitcast (void (i32)* @false to void (...)*)(i32 %call46)
  %call47 = call i32 (...)* bitcast (i32 (i32, i32)* @le to i32 (...)*)(i32 -2147483648, i32 2147483647)
  call void (...)* bitcast (void (i32)* @true to void (...)*)(i32 %call47)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f()
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
