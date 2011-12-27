; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/divcmp-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @test1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp eq i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp eq i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp ne i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp ne i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp slt i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp slt i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp sle i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp sle i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp sgt i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test10(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp sgt i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test11(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp sge i32 %div, 2
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test12(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %div = sdiv i32 %tmp, -10
  %cmp = icmp sge i32 %div, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test1(i32 -30)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @test1(i32 -29)
  %cmp2 = icmp ne i32 %call1, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @test1(i32 -20)
  %cmp6 = icmp ne i32 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @test1(i32 -19)
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @test2(i32 0)
  %cmp14 = icmp ne i32 %call13, 1
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @test2(i32 9)
  %cmp18 = icmp ne i32 %call17, 1
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @test2(i32 10)
  %cmp22 = icmp ne i32 %call21, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @test2(i32 -1)
  %cmp26 = icmp ne i32 %call25, 1
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i32 @test2(i32 -9)
  %cmp30 = icmp ne i32 %call29, 1
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i32 @test2(i32 -10)
  %cmp34 = icmp ne i32 %call33, 0
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i32 @test3(i32 -30)
  %cmp38 = icmp ne i32 %call37, 1
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i32 @test3(i32 -29)
  %cmp42 = icmp ne i32 %call41, 0
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i32 @test3(i32 -20)
  %cmp46 = icmp ne i32 %call45, 0
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i32 @test3(i32 -19)
  %cmp50 = icmp ne i32 %call49, 1
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i32 @test4(i32 0)
  %cmp54 = icmp ne i32 %call53, 0
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i32 @test4(i32 9)
  %cmp58 = icmp ne i32 %call57, 0
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i32 @test4(i32 10)
  %cmp62 = icmp ne i32 %call61, 1
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i32 @test4(i32 -1)
  %cmp66 = icmp ne i32 %call65, 0
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i32 @test4(i32 -9)
  %cmp70 = icmp ne i32 %call69, 0
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i32 @test4(i32 -10)
  %cmp74 = icmp ne i32 %call73, 1
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i32 @test5(i32 -30)
  %cmp78 = icmp ne i32 %call77, 0
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end76
  %call81 = call i32 @test5(i32 -29)
  %cmp82 = icmp ne i32 %call81, 0
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call85 = call i32 @test5(i32 -20)
  %cmp86 = icmp ne i32 %call85, 0
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %call89 = call i32 @test5(i32 -19)
  %cmp90 = icmp ne i32 %call89, 1
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end88
  %call93 = call i32 @test6(i32 0)
  %cmp94 = icmp ne i32 %call93, 0
  br i1 %cmp94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end92
  %call97 = call i32 @test6(i32 9)
  %cmp98 = icmp ne i32 %call97, 0
  br i1 %cmp98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end100:                                        ; preds = %if.end96
  %call101 = call i32 @test6(i32 10)
  %cmp102 = icmp ne i32 %call101, 1
  br i1 %cmp102, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end100
  call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end100
  %call105 = call i32 @test6(i32 -1)
  %cmp106 = icmp ne i32 %call105, 0
  br i1 %cmp106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end104
  call void @abort() noreturn nounwind
  unreachable

if.end108:                                        ; preds = %if.end104
  %call109 = call i32 @test6(i32 -9)
  %cmp110 = icmp ne i32 %call109, 0
  br i1 %cmp110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end108
  call void @abort() noreturn nounwind
  unreachable

if.end112:                                        ; preds = %if.end108
  %call113 = call i32 @test6(i32 -10)
  %cmp114 = icmp ne i32 %call113, 0
  br i1 %cmp114, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.end112
  call void @abort() noreturn nounwind
  unreachable

if.end116:                                        ; preds = %if.end112
  %call117 = call i32 @test7(i32 -30)
  %cmp118 = icmp ne i32 %call117, 0
  br i1 %cmp118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  call void @abort() noreturn nounwind
  unreachable

if.end120:                                        ; preds = %if.end116
  %call121 = call i32 @test7(i32 -29)
  %cmp122 = icmp ne i32 %call121, 1
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end120
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end120
  %call125 = call i32 @test7(i32 -20)
  %cmp126 = icmp ne i32 %call125, 1
  br i1 %cmp126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end124
  call void @abort() noreturn nounwind
  unreachable

if.end128:                                        ; preds = %if.end124
  %call129 = call i32 @test7(i32 -19)
  %cmp130 = icmp ne i32 %call129, 1
  br i1 %cmp130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.end128
  call void @abort() noreturn nounwind
  unreachable

if.end132:                                        ; preds = %if.end128
  %call133 = call i32 @test8(i32 0)
  %cmp134 = icmp ne i32 %call133, 1
  br i1 %cmp134, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end132
  call void @abort() noreturn nounwind
  unreachable

if.end136:                                        ; preds = %if.end132
  %call137 = call i32 @test8(i32 9)
  %cmp138 = icmp ne i32 %call137, 1
  br i1 %cmp138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end136
  call void @abort() noreturn nounwind
  unreachable

if.end140:                                        ; preds = %if.end136
  %call141 = call i32 @test8(i32 10)
  %cmp142 = icmp ne i32 %call141, 1
  br i1 %cmp142, label %if.then143, label %if.end144

if.then143:                                       ; preds = %if.end140
  call void @abort() noreturn nounwind
  unreachable

if.end144:                                        ; preds = %if.end140
  %call145 = call i32 @test8(i32 -1)
  %cmp146 = icmp ne i32 %call145, 1
  br i1 %cmp146, label %if.then147, label %if.end148

if.then147:                                       ; preds = %if.end144
  call void @abort() noreturn nounwind
  unreachable

if.end148:                                        ; preds = %if.end144
  %call149 = call i32 @test8(i32 -9)
  %cmp150 = icmp ne i32 %call149, 1
  br i1 %cmp150, label %if.then151, label %if.end152

if.then151:                                       ; preds = %if.end148
  call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %if.end148
  %call153 = call i32 @test8(i32 -10)
  %cmp154 = icmp ne i32 %call153, 0
  br i1 %cmp154, label %if.then155, label %if.end156

if.then155:                                       ; preds = %if.end152
  call void @abort() noreturn nounwind
  unreachable

if.end156:                                        ; preds = %if.end152
  %call157 = call i32 @test9(i32 -30)
  %cmp158 = icmp ne i32 %call157, 1
  br i1 %cmp158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end156
  call void @abort() noreturn nounwind
  unreachable

if.end160:                                        ; preds = %if.end156
  %call161 = call i32 @test9(i32 -29)
  %cmp162 = icmp ne i32 %call161, 0
  br i1 %cmp162, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end160
  call void @abort() noreturn nounwind
  unreachable

if.end164:                                        ; preds = %if.end160
  %call165 = call i32 @test9(i32 -20)
  %cmp166 = icmp ne i32 %call165, 0
  br i1 %cmp166, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.end164
  call void @abort() noreturn nounwind
  unreachable

if.end168:                                        ; preds = %if.end164
  %call169 = call i32 @test9(i32 -19)
  %cmp170 = icmp ne i32 %call169, 0
  br i1 %cmp170, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end168
  call void @abort() noreturn nounwind
  unreachable

if.end172:                                        ; preds = %if.end168
  %call173 = call i32 @test10(i32 0)
  %cmp174 = icmp ne i32 %call173, 0
  br i1 %cmp174, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.end172
  call void @abort() noreturn nounwind
  unreachable

if.end176:                                        ; preds = %if.end172
  %call177 = call i32 @test10(i32 9)
  %cmp178 = icmp ne i32 %call177, 0
  br i1 %cmp178, label %if.then179, label %if.end180

if.then179:                                       ; preds = %if.end176
  call void @abort() noreturn nounwind
  unreachable

if.end180:                                        ; preds = %if.end176
  %call181 = call i32 @test10(i32 10)
  %cmp182 = icmp ne i32 %call181, 0
  br i1 %cmp182, label %if.then183, label %if.end184

if.then183:                                       ; preds = %if.end180
  call void @abort() noreturn nounwind
  unreachable

if.end184:                                        ; preds = %if.end180
  %call185 = call i32 @test10(i32 -1)
  %cmp186 = icmp ne i32 %call185, 0
  br i1 %cmp186, label %if.then187, label %if.end188

if.then187:                                       ; preds = %if.end184
  call void @abort() noreturn nounwind
  unreachable

if.end188:                                        ; preds = %if.end184
  %call189 = call i32 @test10(i32 -9)
  %cmp190 = icmp ne i32 %call189, 0
  br i1 %cmp190, label %if.then191, label %if.end192

if.then191:                                       ; preds = %if.end188
  call void @abort() noreturn nounwind
  unreachable

if.end192:                                        ; preds = %if.end188
  %call193 = call i32 @test10(i32 -10)
  %cmp194 = icmp ne i32 %call193, 1
  br i1 %cmp194, label %if.then195, label %if.end196

if.then195:                                       ; preds = %if.end192
  call void @abort() noreturn nounwind
  unreachable

if.end196:                                        ; preds = %if.end192
  %call197 = call i32 @test11(i32 -30)
  %cmp198 = icmp ne i32 %call197, 1
  br i1 %cmp198, label %if.then199, label %if.end200

if.then199:                                       ; preds = %if.end196
  call void @abort() noreturn nounwind
  unreachable

if.end200:                                        ; preds = %if.end196
  %call201 = call i32 @test11(i32 -29)
  %cmp202 = icmp ne i32 %call201, 1
  br i1 %cmp202, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end200
  call void @abort() noreturn nounwind
  unreachable

if.end204:                                        ; preds = %if.end200
  %call205 = call i32 @test11(i32 -20)
  %cmp206 = icmp ne i32 %call205, 1
  br i1 %cmp206, label %if.then207, label %if.end208

if.then207:                                       ; preds = %if.end204
  call void @abort() noreturn nounwind
  unreachable

if.end208:                                        ; preds = %if.end204
  %call209 = call i32 @test11(i32 -19)
  %cmp210 = icmp ne i32 %call209, 0
  br i1 %cmp210, label %if.then211, label %if.end212

if.then211:                                       ; preds = %if.end208
  call void @abort() noreturn nounwind
  unreachable

if.end212:                                        ; preds = %if.end208
  %call213 = call i32 @test12(i32 0)
  %cmp214 = icmp ne i32 %call213, 1
  br i1 %cmp214, label %if.then215, label %if.end216

if.then215:                                       ; preds = %if.end212
  call void @abort() noreturn nounwind
  unreachable

if.end216:                                        ; preds = %if.end212
  %call217 = call i32 @test12(i32 9)
  %cmp218 = icmp ne i32 %call217, 1
  br i1 %cmp218, label %if.then219, label %if.end220

if.then219:                                       ; preds = %if.end216
  call void @abort() noreturn nounwind
  unreachable

if.end220:                                        ; preds = %if.end216
  %call221 = call i32 @test12(i32 10)
  %cmp222 = icmp ne i32 %call221, 0
  br i1 %cmp222, label %if.then223, label %if.end224

if.then223:                                       ; preds = %if.end220
  call void @abort() noreturn nounwind
  unreachable

if.end224:                                        ; preds = %if.end220
  %call225 = call i32 @test12(i32 -1)
  %cmp226 = icmp ne i32 %call225, 1
  br i1 %cmp226, label %if.then227, label %if.end228

if.then227:                                       ; preds = %if.end224
  call void @abort() noreturn nounwind
  unreachable

if.end228:                                        ; preds = %if.end224
  %call229 = call i32 @test12(i32 -9)
  %cmp230 = icmp ne i32 %call229, 1
  br i1 %cmp230, label %if.then231, label %if.end232

if.then231:                                       ; preds = %if.end228
  call void @abort() noreturn nounwind
  unreachable

if.end232:                                        ; preds = %if.end228
  %call233 = call i32 @test12(i32 -10)
  %cmp234 = icmp ne i32 %call233, 1
  br i1 %cmp234, label %if.then235, label %if.end236

if.then235:                                       ; preds = %if.end232
  call void @abort() noreturn nounwind
  unreachable

if.end236:                                        ; preds = %if.end232
  ret i32 0
}

declare void @abort() noreturn nounwind
