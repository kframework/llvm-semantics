; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divcmp-1.c'
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

define i32 @test1u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
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

define i32 @test2u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
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
  %cmp = icmp ne i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test3u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ne i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp ne i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test4u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ne i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp slt i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test5u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ult i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp slt i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp sle i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test7u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ule i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp sle i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test8u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ule i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp sgt i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test9u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ugt i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test10(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp sgt i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test10u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp ugt i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test11(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp sge i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test11u(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = udiv i32 %0, 10
  %cmp = icmp uge i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test12(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %div = sdiv i32 %0, 10
  %cmp = icmp sge i32 %div, 0
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
  %call13 = call i32 @test1u(i32 19)
  %cmp14 = icmp ne i32 %call13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @test1u(i32 20)
  %cmp18 = icmp ne i32 %call17, 1
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @test1u(i32 29)
  %cmp22 = icmp ne i32 %call21, 1
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @test1u(i32 30)
  %cmp26 = icmp ne i32 %call25, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i32 @test2(i32 0)
  %cmp30 = icmp ne i32 %call29, 1
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i32 @test2(i32 9)
  %cmp34 = icmp ne i32 %call33, 1
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i32 @test2(i32 10)
  %cmp38 = icmp ne i32 %call37, 0
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i32 @test2(i32 -1)
  %cmp42 = icmp ne i32 %call41, 1
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i32 @test2(i32 -9)
  %cmp46 = icmp ne i32 %call45, 1
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i32 @test2(i32 -10)
  %cmp50 = icmp ne i32 %call49, 0
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i32 @test2u(i32 0)
  %cmp54 = icmp ne i32 %call53, 1
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i32 @test2u(i32 9)
  %cmp58 = icmp ne i32 %call57, 1
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i32 @test2u(i32 10)
  %cmp62 = icmp ne i32 %call61, 0
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i32 @test2u(i32 -1)
  %cmp66 = icmp ne i32 %call65, 0
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i32 @test2u(i32 -9)
  %cmp70 = icmp ne i32 %call69, 0
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i32 @test2u(i32 -10)
  %cmp74 = icmp ne i32 %call73, 0
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i32 @test3(i32 19)
  %cmp78 = icmp ne i32 %call77, 1
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end76
  %call81 = call i32 @test3(i32 20)
  %cmp82 = icmp ne i32 %call81, 0
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call85 = call i32 @test3(i32 29)
  %cmp86 = icmp ne i32 %call85, 0
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %call89 = call i32 @test3(i32 30)
  %cmp90 = icmp ne i32 %call89, 1
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end88
  %call93 = call i32 @test3u(i32 19)
  %cmp94 = icmp ne i32 %call93, 1
  br i1 %cmp94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end92
  %call97 = call i32 @test3u(i32 20)
  %cmp98 = icmp ne i32 %call97, 0
  br i1 %cmp98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end100:                                        ; preds = %if.end96
  %call101 = call i32 @test3u(i32 29)
  %cmp102 = icmp ne i32 %call101, 0
  br i1 %cmp102, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end100
  call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end100
  %call105 = call i32 @test3u(i32 30)
  %cmp106 = icmp ne i32 %call105, 1
  br i1 %cmp106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end104
  call void @abort() noreturn nounwind
  unreachable

if.end108:                                        ; preds = %if.end104
  %call109 = call i32 @test4(i32 0)
  %cmp110 = icmp ne i32 %call109, 0
  br i1 %cmp110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end108
  call void @abort() noreturn nounwind
  unreachable

if.end112:                                        ; preds = %if.end108
  %call113 = call i32 @test4(i32 9)
  %cmp114 = icmp ne i32 %call113, 0
  br i1 %cmp114, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.end112
  call void @abort() noreturn nounwind
  unreachable

if.end116:                                        ; preds = %if.end112
  %call117 = call i32 @test4(i32 10)
  %cmp118 = icmp ne i32 %call117, 1
  br i1 %cmp118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  call void @abort() noreturn nounwind
  unreachable

if.end120:                                        ; preds = %if.end116
  %call121 = call i32 @test4(i32 -1)
  %cmp122 = icmp ne i32 %call121, 0
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end120
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end120
  %call125 = call i32 @test4(i32 -9)
  %cmp126 = icmp ne i32 %call125, 0
  br i1 %cmp126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end124
  call void @abort() noreturn nounwind
  unreachable

if.end128:                                        ; preds = %if.end124
  %call129 = call i32 @test4(i32 -10)
  %cmp130 = icmp ne i32 %call129, 1
  br i1 %cmp130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.end128
  call void @abort() noreturn nounwind
  unreachable

if.end132:                                        ; preds = %if.end128
  %call133 = call i32 @test4u(i32 0)
  %cmp134 = icmp ne i32 %call133, 0
  br i1 %cmp134, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end132
  call void @abort() noreturn nounwind
  unreachable

if.end136:                                        ; preds = %if.end132
  %call137 = call i32 @test4u(i32 9)
  %cmp138 = icmp ne i32 %call137, 0
  br i1 %cmp138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end136
  call void @abort() noreturn nounwind
  unreachable

if.end140:                                        ; preds = %if.end136
  %call141 = call i32 @test4u(i32 10)
  %cmp142 = icmp ne i32 %call141, 1
  br i1 %cmp142, label %if.then143, label %if.end144

if.then143:                                       ; preds = %if.end140
  call void @abort() noreturn nounwind
  unreachable

if.end144:                                        ; preds = %if.end140
  %call145 = call i32 @test4u(i32 -1)
  %cmp146 = icmp ne i32 %call145, 1
  br i1 %cmp146, label %if.then147, label %if.end148

if.then147:                                       ; preds = %if.end144
  call void @abort() noreturn nounwind
  unreachable

if.end148:                                        ; preds = %if.end144
  %call149 = call i32 @test4u(i32 -9)
  %cmp150 = icmp ne i32 %call149, 1
  br i1 %cmp150, label %if.then151, label %if.end152

if.then151:                                       ; preds = %if.end148
  call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %if.end148
  %call153 = call i32 @test4u(i32 -10)
  %cmp154 = icmp ne i32 %call153, 1
  br i1 %cmp154, label %if.then155, label %if.end156

if.then155:                                       ; preds = %if.end152
  call void @abort() noreturn nounwind
  unreachable

if.end156:                                        ; preds = %if.end152
  %call157 = call i32 @test5(i32 19)
  %cmp158 = icmp ne i32 %call157, 1
  br i1 %cmp158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end156
  call void @abort() noreturn nounwind
  unreachable

if.end160:                                        ; preds = %if.end156
  %call161 = call i32 @test5(i32 20)
  %cmp162 = icmp ne i32 %call161, 0
  br i1 %cmp162, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end160
  call void @abort() noreturn nounwind
  unreachable

if.end164:                                        ; preds = %if.end160
  %call165 = call i32 @test5(i32 29)
  %cmp166 = icmp ne i32 %call165, 0
  br i1 %cmp166, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.end164
  call void @abort() noreturn nounwind
  unreachable

if.end168:                                        ; preds = %if.end164
  %call169 = call i32 @test5(i32 30)
  %cmp170 = icmp ne i32 %call169, 0
  br i1 %cmp170, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end168
  call void @abort() noreturn nounwind
  unreachable

if.end172:                                        ; preds = %if.end168
  %call173 = call i32 @test5u(i32 19)
  %cmp174 = icmp ne i32 %call173, 1
  br i1 %cmp174, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.end172
  call void @abort() noreturn nounwind
  unreachable

if.end176:                                        ; preds = %if.end172
  %call177 = call i32 @test5u(i32 20)
  %cmp178 = icmp ne i32 %call177, 0
  br i1 %cmp178, label %if.then179, label %if.end180

if.then179:                                       ; preds = %if.end176
  call void @abort() noreturn nounwind
  unreachable

if.end180:                                        ; preds = %if.end176
  %call181 = call i32 @test5u(i32 29)
  %cmp182 = icmp ne i32 %call181, 0
  br i1 %cmp182, label %if.then183, label %if.end184

if.then183:                                       ; preds = %if.end180
  call void @abort() noreturn nounwind
  unreachable

if.end184:                                        ; preds = %if.end180
  %call185 = call i32 @test5u(i32 30)
  %cmp186 = icmp ne i32 %call185, 0
  br i1 %cmp186, label %if.then187, label %if.end188

if.then187:                                       ; preds = %if.end184
  call void @abort() noreturn nounwind
  unreachable

if.end188:                                        ; preds = %if.end184
  %call189 = call i32 @test6(i32 0)
  %cmp190 = icmp ne i32 %call189, 0
  br i1 %cmp190, label %if.then191, label %if.end192

if.then191:                                       ; preds = %if.end188
  call void @abort() noreturn nounwind
  unreachable

if.end192:                                        ; preds = %if.end188
  %call193 = call i32 @test6(i32 9)
  %cmp194 = icmp ne i32 %call193, 0
  br i1 %cmp194, label %if.then195, label %if.end196

if.then195:                                       ; preds = %if.end192
  call void @abort() noreturn nounwind
  unreachable

if.end196:                                        ; preds = %if.end192
  %call197 = call i32 @test6(i32 10)
  %cmp198 = icmp ne i32 %call197, 0
  br i1 %cmp198, label %if.then199, label %if.end200

if.then199:                                       ; preds = %if.end196
  call void @abort() noreturn nounwind
  unreachable

if.end200:                                        ; preds = %if.end196
  %call201 = call i32 @test6(i32 -1)
  %cmp202 = icmp ne i32 %call201, 0
  br i1 %cmp202, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end200
  call void @abort() noreturn nounwind
  unreachable

if.end204:                                        ; preds = %if.end200
  %call205 = call i32 @test6(i32 -9)
  %cmp206 = icmp ne i32 %call205, 0
  br i1 %cmp206, label %if.then207, label %if.end208

if.then207:                                       ; preds = %if.end204
  call void @abort() noreturn nounwind
  unreachable

if.end208:                                        ; preds = %if.end204
  %call209 = call i32 @test6(i32 -10)
  %cmp210 = icmp ne i32 %call209, 1
  br i1 %cmp210, label %if.then211, label %if.end212

if.then211:                                       ; preds = %if.end208
  call void @abort() noreturn nounwind
  unreachable

if.end212:                                        ; preds = %if.end208
  %call213 = call i32 @test7(i32 19)
  %cmp214 = icmp ne i32 %call213, 1
  br i1 %cmp214, label %if.then215, label %if.end216

if.then215:                                       ; preds = %if.end212
  call void @abort() noreturn nounwind
  unreachable

if.end216:                                        ; preds = %if.end212
  %call217 = call i32 @test7(i32 20)
  %cmp218 = icmp ne i32 %call217, 1
  br i1 %cmp218, label %if.then219, label %if.end220

if.then219:                                       ; preds = %if.end216
  call void @abort() noreturn nounwind
  unreachable

if.end220:                                        ; preds = %if.end216
  %call221 = call i32 @test7(i32 29)
  %cmp222 = icmp ne i32 %call221, 1
  br i1 %cmp222, label %if.then223, label %if.end224

if.then223:                                       ; preds = %if.end220
  call void @abort() noreturn nounwind
  unreachable

if.end224:                                        ; preds = %if.end220
  %call225 = call i32 @test7(i32 30)
  %cmp226 = icmp ne i32 %call225, 0
  br i1 %cmp226, label %if.then227, label %if.end228

if.then227:                                       ; preds = %if.end224
  call void @abort() noreturn nounwind
  unreachable

if.end228:                                        ; preds = %if.end224
  %call229 = call i32 @test7u(i32 19)
  %cmp230 = icmp ne i32 %call229, 1
  br i1 %cmp230, label %if.then231, label %if.end232

if.then231:                                       ; preds = %if.end228
  call void @abort() noreturn nounwind
  unreachable

if.end232:                                        ; preds = %if.end228
  %call233 = call i32 @test7u(i32 20)
  %cmp234 = icmp ne i32 %call233, 1
  br i1 %cmp234, label %if.then235, label %if.end236

if.then235:                                       ; preds = %if.end232
  call void @abort() noreturn nounwind
  unreachable

if.end236:                                        ; preds = %if.end232
  %call237 = call i32 @test7u(i32 29)
  %cmp238 = icmp ne i32 %call237, 1
  br i1 %cmp238, label %if.then239, label %if.end240

if.then239:                                       ; preds = %if.end236
  call void @abort() noreturn nounwind
  unreachable

if.end240:                                        ; preds = %if.end236
  %call241 = call i32 @test7u(i32 30)
  %cmp242 = icmp ne i32 %call241, 0
  br i1 %cmp242, label %if.then243, label %if.end244

if.then243:                                       ; preds = %if.end240
  call void @abort() noreturn nounwind
  unreachable

if.end244:                                        ; preds = %if.end240
  %call245 = call i32 @test8(i32 0)
  %cmp246 = icmp ne i32 %call245, 1
  br i1 %cmp246, label %if.then247, label %if.end248

if.then247:                                       ; preds = %if.end244
  call void @abort() noreturn nounwind
  unreachable

if.end248:                                        ; preds = %if.end244
  %call249 = call i32 @test8(i32 9)
  %cmp250 = icmp ne i32 %call249, 1
  br i1 %cmp250, label %if.then251, label %if.end252

if.then251:                                       ; preds = %if.end248
  call void @abort() noreturn nounwind
  unreachable

if.end252:                                        ; preds = %if.end248
  %call253 = call i32 @test8(i32 10)
  %cmp254 = icmp ne i32 %call253, 0
  br i1 %cmp254, label %if.then255, label %if.end256

if.then255:                                       ; preds = %if.end252
  call void @abort() noreturn nounwind
  unreachable

if.end256:                                        ; preds = %if.end252
  %call257 = call i32 @test8(i32 -1)
  %cmp258 = icmp ne i32 %call257, 1
  br i1 %cmp258, label %if.then259, label %if.end260

if.then259:                                       ; preds = %if.end256
  call void @abort() noreturn nounwind
  unreachable

if.end260:                                        ; preds = %if.end256
  %call261 = call i32 @test8(i32 -9)
  %cmp262 = icmp ne i32 %call261, 1
  br i1 %cmp262, label %if.then263, label %if.end264

if.then263:                                       ; preds = %if.end260
  call void @abort() noreturn nounwind
  unreachable

if.end264:                                        ; preds = %if.end260
  %call265 = call i32 @test8(i32 -10)
  %cmp266 = icmp ne i32 %call265, 1
  br i1 %cmp266, label %if.then267, label %if.end268

if.then267:                                       ; preds = %if.end264
  call void @abort() noreturn nounwind
  unreachable

if.end268:                                        ; preds = %if.end264
  %call269 = call i32 @test8u(i32 0)
  %cmp270 = icmp ne i32 %call269, 1
  br i1 %cmp270, label %if.then271, label %if.end272

if.then271:                                       ; preds = %if.end268
  call void @abort() noreturn nounwind
  unreachable

if.end272:                                        ; preds = %if.end268
  %call273 = call i32 @test8u(i32 9)
  %cmp274 = icmp ne i32 %call273, 1
  br i1 %cmp274, label %if.then275, label %if.end276

if.then275:                                       ; preds = %if.end272
  call void @abort() noreturn nounwind
  unreachable

if.end276:                                        ; preds = %if.end272
  %call277 = call i32 @test8u(i32 10)
  %cmp278 = icmp ne i32 %call277, 0
  br i1 %cmp278, label %if.then279, label %if.end280

if.then279:                                       ; preds = %if.end276
  call void @abort() noreturn nounwind
  unreachable

if.end280:                                        ; preds = %if.end276
  %call281 = call i32 @test8u(i32 -1)
  %cmp282 = icmp ne i32 %call281, 0
  br i1 %cmp282, label %if.then283, label %if.end284

if.then283:                                       ; preds = %if.end280
  call void @abort() noreturn nounwind
  unreachable

if.end284:                                        ; preds = %if.end280
  %call285 = call i32 @test8u(i32 -9)
  %cmp286 = icmp ne i32 %call285, 0
  br i1 %cmp286, label %if.then287, label %if.end288

if.then287:                                       ; preds = %if.end284
  call void @abort() noreturn nounwind
  unreachable

if.end288:                                        ; preds = %if.end284
  %call289 = call i32 @test8u(i32 -10)
  %cmp290 = icmp ne i32 %call289, 0
  br i1 %cmp290, label %if.then291, label %if.end292

if.then291:                                       ; preds = %if.end288
  call void @abort() noreturn nounwind
  unreachable

if.end292:                                        ; preds = %if.end288
  %call293 = call i32 @test9(i32 19)
  %cmp294 = icmp ne i32 %call293, 0
  br i1 %cmp294, label %if.then295, label %if.end296

if.then295:                                       ; preds = %if.end292
  call void @abort() noreturn nounwind
  unreachable

if.end296:                                        ; preds = %if.end292
  %call297 = call i32 @test9(i32 20)
  %cmp298 = icmp ne i32 %call297, 0
  br i1 %cmp298, label %if.then299, label %if.end300

if.then299:                                       ; preds = %if.end296
  call void @abort() noreturn nounwind
  unreachable

if.end300:                                        ; preds = %if.end296
  %call301 = call i32 @test9(i32 29)
  %cmp302 = icmp ne i32 %call301, 0
  br i1 %cmp302, label %if.then303, label %if.end304

if.then303:                                       ; preds = %if.end300
  call void @abort() noreturn nounwind
  unreachable

if.end304:                                        ; preds = %if.end300
  %call305 = call i32 @test9(i32 30)
  %cmp306 = icmp ne i32 %call305, 1
  br i1 %cmp306, label %if.then307, label %if.end308

if.then307:                                       ; preds = %if.end304
  call void @abort() noreturn nounwind
  unreachable

if.end308:                                        ; preds = %if.end304
  %call309 = call i32 @test9u(i32 19)
  %cmp310 = icmp ne i32 %call309, 0
  br i1 %cmp310, label %if.then311, label %if.end312

if.then311:                                       ; preds = %if.end308
  call void @abort() noreturn nounwind
  unreachable

if.end312:                                        ; preds = %if.end308
  %call313 = call i32 @test9u(i32 20)
  %cmp314 = icmp ne i32 %call313, 0
  br i1 %cmp314, label %if.then315, label %if.end316

if.then315:                                       ; preds = %if.end312
  call void @abort() noreturn nounwind
  unreachable

if.end316:                                        ; preds = %if.end312
  %call317 = call i32 @test9u(i32 29)
  %cmp318 = icmp ne i32 %call317, 0
  br i1 %cmp318, label %if.then319, label %if.end320

if.then319:                                       ; preds = %if.end316
  call void @abort() noreturn nounwind
  unreachable

if.end320:                                        ; preds = %if.end316
  %call321 = call i32 @test9u(i32 30)
  %cmp322 = icmp ne i32 %call321, 1
  br i1 %cmp322, label %if.then323, label %if.end324

if.then323:                                       ; preds = %if.end320
  call void @abort() noreturn nounwind
  unreachable

if.end324:                                        ; preds = %if.end320
  %call325 = call i32 @test10(i32 0)
  %cmp326 = icmp ne i32 %call325, 0
  br i1 %cmp326, label %if.then327, label %if.end328

if.then327:                                       ; preds = %if.end324
  call void @abort() noreturn nounwind
  unreachable

if.end328:                                        ; preds = %if.end324
  %call329 = call i32 @test10(i32 9)
  %cmp330 = icmp ne i32 %call329, 0
  br i1 %cmp330, label %if.then331, label %if.end332

if.then331:                                       ; preds = %if.end328
  call void @abort() noreturn nounwind
  unreachable

if.end332:                                        ; preds = %if.end328
  %call333 = call i32 @test10(i32 10)
  %cmp334 = icmp ne i32 %call333, 1
  br i1 %cmp334, label %if.then335, label %if.end336

if.then335:                                       ; preds = %if.end332
  call void @abort() noreturn nounwind
  unreachable

if.end336:                                        ; preds = %if.end332
  %call337 = call i32 @test10(i32 -1)
  %cmp338 = icmp ne i32 %call337, 0
  br i1 %cmp338, label %if.then339, label %if.end340

if.then339:                                       ; preds = %if.end336
  call void @abort() noreturn nounwind
  unreachable

if.end340:                                        ; preds = %if.end336
  %call341 = call i32 @test10(i32 -9)
  %cmp342 = icmp ne i32 %call341, 0
  br i1 %cmp342, label %if.then343, label %if.end344

if.then343:                                       ; preds = %if.end340
  call void @abort() noreturn nounwind
  unreachable

if.end344:                                        ; preds = %if.end340
  %call345 = call i32 @test10(i32 -10)
  %cmp346 = icmp ne i32 %call345, 0
  br i1 %cmp346, label %if.then347, label %if.end348

if.then347:                                       ; preds = %if.end344
  call void @abort() noreturn nounwind
  unreachable

if.end348:                                        ; preds = %if.end344
  %call349 = call i32 @test10u(i32 0)
  %cmp350 = icmp ne i32 %call349, 0
  br i1 %cmp350, label %if.then351, label %if.end352

if.then351:                                       ; preds = %if.end348
  call void @abort() noreturn nounwind
  unreachable

if.end352:                                        ; preds = %if.end348
  %call353 = call i32 @test10u(i32 9)
  %cmp354 = icmp ne i32 %call353, 0
  br i1 %cmp354, label %if.then355, label %if.end356

if.then355:                                       ; preds = %if.end352
  call void @abort() noreturn nounwind
  unreachable

if.end356:                                        ; preds = %if.end352
  %call357 = call i32 @test10u(i32 10)
  %cmp358 = icmp ne i32 %call357, 1
  br i1 %cmp358, label %if.then359, label %if.end360

if.then359:                                       ; preds = %if.end356
  call void @abort() noreturn nounwind
  unreachable

if.end360:                                        ; preds = %if.end356
  %call361 = call i32 @test10u(i32 -1)
  %cmp362 = icmp ne i32 %call361, 1
  br i1 %cmp362, label %if.then363, label %if.end364

if.then363:                                       ; preds = %if.end360
  call void @abort() noreturn nounwind
  unreachable

if.end364:                                        ; preds = %if.end360
  %call365 = call i32 @test10u(i32 -9)
  %cmp366 = icmp ne i32 %call365, 1
  br i1 %cmp366, label %if.then367, label %if.end368

if.then367:                                       ; preds = %if.end364
  call void @abort() noreturn nounwind
  unreachable

if.end368:                                        ; preds = %if.end364
  %call369 = call i32 @test10u(i32 -10)
  %cmp370 = icmp ne i32 %call369, 1
  br i1 %cmp370, label %if.then371, label %if.end372

if.then371:                                       ; preds = %if.end368
  call void @abort() noreturn nounwind
  unreachable

if.end372:                                        ; preds = %if.end368
  %call373 = call i32 @test11(i32 19)
  %cmp374 = icmp ne i32 %call373, 0
  br i1 %cmp374, label %if.then375, label %if.end376

if.then375:                                       ; preds = %if.end372
  call void @abort() noreturn nounwind
  unreachable

if.end376:                                        ; preds = %if.end372
  %call377 = call i32 @test11(i32 20)
  %cmp378 = icmp ne i32 %call377, 1
  br i1 %cmp378, label %if.then379, label %if.end380

if.then379:                                       ; preds = %if.end376
  call void @abort() noreturn nounwind
  unreachable

if.end380:                                        ; preds = %if.end376
  %call381 = call i32 @test11(i32 29)
  %cmp382 = icmp ne i32 %call381, 1
  br i1 %cmp382, label %if.then383, label %if.end384

if.then383:                                       ; preds = %if.end380
  call void @abort() noreturn nounwind
  unreachable

if.end384:                                        ; preds = %if.end380
  %call385 = call i32 @test11(i32 30)
  %cmp386 = icmp ne i32 %call385, 1
  br i1 %cmp386, label %if.then387, label %if.end388

if.then387:                                       ; preds = %if.end384
  call void @abort() noreturn nounwind
  unreachable

if.end388:                                        ; preds = %if.end384
  %call389 = call i32 @test11u(i32 19)
  %cmp390 = icmp ne i32 %call389, 0
  br i1 %cmp390, label %if.then391, label %if.end392

if.then391:                                       ; preds = %if.end388
  call void @abort() noreturn nounwind
  unreachable

if.end392:                                        ; preds = %if.end388
  %call393 = call i32 @test11u(i32 20)
  %cmp394 = icmp ne i32 %call393, 1
  br i1 %cmp394, label %if.then395, label %if.end396

if.then395:                                       ; preds = %if.end392
  call void @abort() noreturn nounwind
  unreachable

if.end396:                                        ; preds = %if.end392
  %call397 = call i32 @test11u(i32 29)
  %cmp398 = icmp ne i32 %call397, 1
  br i1 %cmp398, label %if.then399, label %if.end400

if.then399:                                       ; preds = %if.end396
  call void @abort() noreturn nounwind
  unreachable

if.end400:                                        ; preds = %if.end396
  %call401 = call i32 @test11u(i32 30)
  %cmp402 = icmp ne i32 %call401, 1
  br i1 %cmp402, label %if.then403, label %if.end404

if.then403:                                       ; preds = %if.end400
  call void @abort() noreturn nounwind
  unreachable

if.end404:                                        ; preds = %if.end400
  %call405 = call i32 @test12(i32 0)
  %cmp406 = icmp ne i32 %call405, 1
  br i1 %cmp406, label %if.then407, label %if.end408

if.then407:                                       ; preds = %if.end404
  call void @abort() noreturn nounwind
  unreachable

if.end408:                                        ; preds = %if.end404
  %call409 = call i32 @test12(i32 9)
  %cmp410 = icmp ne i32 %call409, 1
  br i1 %cmp410, label %if.then411, label %if.end412

if.then411:                                       ; preds = %if.end408
  call void @abort() noreturn nounwind
  unreachable

if.end412:                                        ; preds = %if.end408
  %call413 = call i32 @test12(i32 10)
  %cmp414 = icmp ne i32 %call413, 1
  br i1 %cmp414, label %if.then415, label %if.end416

if.then415:                                       ; preds = %if.end412
  call void @abort() noreturn nounwind
  unreachable

if.end416:                                        ; preds = %if.end412
  %call417 = call i32 @test12(i32 -1)
  %cmp418 = icmp ne i32 %call417, 1
  br i1 %cmp418, label %if.then419, label %if.end420

if.then419:                                       ; preds = %if.end416
  call void @abort() noreturn nounwind
  unreachable

if.end420:                                        ; preds = %if.end416
  %call421 = call i32 @test12(i32 -9)
  %cmp422 = icmp ne i32 %call421, 1
  br i1 %cmp422, label %if.then423, label %if.end424

if.then423:                                       ; preds = %if.end420
  call void @abort() noreturn nounwind
  unreachable

if.end424:                                        ; preds = %if.end420
  %call425 = call i32 @test12(i32 -10)
  %cmp426 = icmp ne i32 %call425, 0
  br i1 %cmp426, label %if.then427, label %if.end428

if.then427:                                       ; preds = %if.end424
  call void @abort() noreturn nounwind
  unreachable

if.end428:                                        ; preds = %if.end424
  ret i32 0
}

declare void @abort() noreturn nounwind
