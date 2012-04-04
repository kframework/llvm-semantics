; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/compare-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @ieq(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp sle i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp sge i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %land.lhs.true, %entry
  %5 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %6 = load i32* %x.addr, align 4
  %7 = load i32* %y.addr, align 4
  %cmp7 = icmp sle i32 %6, %7
  br i1 %cmp7, label %land.lhs.true8, label %if.else14

land.lhs.true8:                                   ; preds = %if.end6
  %8 = load i32* %x.addr, align 4
  %9 = load i32* %y.addr, align 4
  %cmp9 = icmp eq i32 %8, %9
  br i1 %cmp9, label %if.then10, label %if.else14

if.then10:                                        ; preds = %land.lhs.true8
  %10 = load i32* %ok.addr, align 4
  %tobool11 = icmp ne i32 %10, 0
  br i1 %tobool11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.then10
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.then10
  br label %if.end18

if.else14:                                        ; preds = %land.lhs.true8, %if.end6
  %11 = load i32* %ok.addr, align 4
  %tobool15 = icmp ne i32 %11, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.else14
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.else14
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end13
  %12 = load i32* %x.addr, align 4
  %13 = load i32* %y.addr, align 4
  %cmp19 = icmp sle i32 %12, %13
  br i1 %cmp19, label %land.lhs.true20, label %if.else26

land.lhs.true20:                                  ; preds = %if.end18
  %14 = load i32* %y.addr, align 4
  %15 = load i32* %x.addr, align 4
  %cmp21 = icmp sle i32 %14, %15
  br i1 %cmp21, label %if.then22, label %if.else26

if.then22:                                        ; preds = %land.lhs.true20
  %16 = load i32* %ok.addr, align 4
  %tobool23 = icmp ne i32 %16, 0
  br i1 %tobool23, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.then22
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.then22
  br label %if.end30

if.else26:                                        ; preds = %land.lhs.true20, %if.end18
  %17 = load i32* %ok.addr, align 4
  %tobool27 = icmp ne i32 %17, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.else26
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.else26
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.end25
  %18 = load i32* %y.addr, align 4
  %19 = load i32* %x.addr, align 4
  %cmp31 = icmp eq i32 %18, %19
  br i1 %cmp31, label %land.lhs.true32, label %if.else38

land.lhs.true32:                                  ; preds = %if.end30
  %20 = load i32* %x.addr, align 4
  %21 = load i32* %y.addr, align 4
  %cmp33 = icmp sle i32 %20, %21
  br i1 %cmp33, label %if.then34, label %if.else38

if.then34:                                        ; preds = %land.lhs.true32
  %22 = load i32* %ok.addr, align 4
  %tobool35 = icmp ne i32 %22, 0
  br i1 %tobool35, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.then34
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.then34
  br label %if.end42

if.else38:                                        ; preds = %land.lhs.true32, %if.end30
  %23 = load i32* %ok.addr, align 4
  %tobool39 = icmp ne i32 %23, 0
  br i1 %tobool39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.else38
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end37
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @ine(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp sgt i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %lor.lhs.false
  %5 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret void
}

define i32 @ilt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp ne i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %land.lhs.true, %entry
  %5 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret i32 0
}

define i32 @ile(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %lor.lhs.false
  %5 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret i32 0
}

define i32 @igt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp ne i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %land.lhs.true, %entry
  %5 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret i32 0
}

define i32 @ige(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %ok.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %ok, i32* %ok.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* %y.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %3 = load i32* %y.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load i32* %ok.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %lor.lhs.false
  %5 = load i32* %ok.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @ieq(i32 1, i32 4, i32 0)
  %call1 = call i32 @ieq(i32 3, i32 3, i32 1)
  %call2 = call i32 @ieq(i32 5, i32 2, i32 0)
  call void @ine(i32 1, i32 4, i32 1)
  call void @ine(i32 3, i32 3, i32 0)
  call void @ine(i32 5, i32 2, i32 1)
  %call3 = call i32 @ilt(i32 1, i32 4, i32 1)
  %call4 = call i32 @ilt(i32 3, i32 3, i32 0)
  %call5 = call i32 @ilt(i32 5, i32 2, i32 0)
  %call6 = call i32 @ile(i32 1, i32 4, i32 1)
  %call7 = call i32 @ile(i32 3, i32 3, i32 1)
  %call8 = call i32 @ile(i32 5, i32 2, i32 0)
  %call9 = call i32 @igt(i32 1, i32 4, i32 0)
  %call10 = call i32 @igt(i32 3, i32 3, i32 0)
  %call11 = call i32 @igt(i32 5, i32 2, i32 1)
  %call12 = call i32 @ige(i32 1, i32 4, i32 0)
  %call13 = call i32 @ige(i32 3, i32 3, i32 1)
  %call14 = call i32 @ige(i32 5, i32 2, i32 1)
  ret i32 0
}
