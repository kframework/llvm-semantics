; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divcmp-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp eq i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp eq i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp eq i32 %div, -2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, -10
  %cmp = icmp eq i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, -10
  %cmp = icmp eq i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, -10
  %cmp = icmp eq i32 %div, -2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test1(i32 19)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @test1(i32 20)
  %cmp2 = icmp ne i32 %call1, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @test1(i32 29)
  %cmp6 = icmp ne i32 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @test1(i32 30)
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @test2(i32 -10)
  %cmp14 = icmp ne i32 %call13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @test2(i32 -9)
  %cmp18 = icmp ne i32 %call17, 1
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @test2(i32 9)
  %cmp22 = icmp ne i32 %call21, 1
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @test2(i32 10)
  %cmp26 = icmp ne i32 %call25, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i32 @test3(i32 -30)
  %cmp30 = icmp ne i32 %call29, 0
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i32 @test3(i32 -29)
  %cmp34 = icmp ne i32 %call33, 1
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i32 @test3(i32 -20)
  %cmp38 = icmp ne i32 %call37, 1
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i32 @test3(i32 -19)
  %cmp42 = icmp ne i32 %call41, 0
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i32 @test4(i32 -30)
  %cmp46 = icmp ne i32 %call45, 0
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i32 @test4(i32 -29)
  %cmp50 = icmp ne i32 %call49, 1
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i32 @test4(i32 -20)
  %cmp54 = icmp ne i32 %call53, 1
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i32 @test4(i32 -19)
  %cmp58 = icmp ne i32 %call57, 0
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i32 @test5(i32 -10)
  %cmp62 = icmp ne i32 %call61, 0
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i32 @test5(i32 -9)
  %cmp66 = icmp ne i32 %call65, 1
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i32 @test5(i32 9)
  %cmp70 = icmp ne i32 %call69, 1
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i32 @test5(i32 10)
  %cmp74 = icmp ne i32 %call73, 0
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i32 @test6(i32 19)
  %cmp78 = icmp ne i32 %call77, 0
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end76
  %call81 = call i32 @test6(i32 20)
  %cmp82 = icmp ne i32 %call81, 1
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call85 = call i32 @test6(i32 29)
  %cmp86 = icmp ne i32 %call85, 1
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %call89 = call i32 @test6(i32 30)
  %cmp90 = icmp ne i32 %call89, 0
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end88
  ret i32 0
}

declare void @abort() noreturn nounwind
