; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/tstdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @feq(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @fne(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @flt(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp slt i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @fge(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp sge i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @fgt(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp sgt i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @fle(i64 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  %cmp = icmp sle i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 13, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 140, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i64)* @feq to i32 (...)*)(i64 0)
  %cmp = icmp ne i32 %call, 13
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 (...)* bitcast (i32 (i64)* @feq to i32 (...)*)(i64 -1)
  %cmp2 = icmp ne i32 %call1, 140
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 (...)* bitcast (i32 (i64)* @feq to i32 (...)*)(i64 -9223372036854775808)
  %cmp6 = icmp ne i32 %call5, 140
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 (...)* bitcast (i32 (i64)* @feq to i32 (...)*)(i64 -9223372036854775807)
  %cmp10 = icmp ne i32 %call9, 140
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 (...)* bitcast (i32 (i64)* @feq to i32 (...)*)(i64 1)
  %cmp14 = icmp ne i32 %call13, 140
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 (...)* bitcast (i32 (i64)* @feq to i32 (...)*)(i64 9223372036854775807)
  %cmp18 = icmp ne i32 %call17, 140
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 (...)* bitcast (i32 (i64)* @fne to i32 (...)*)(i64 0)
  %cmp22 = icmp ne i32 %call21, 140
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 (...)* bitcast (i32 (i64)* @fne to i32 (...)*)(i64 -1)
  %cmp26 = icmp ne i32 %call25, 13
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i32 (...)* bitcast (i32 (i64)* @fne to i32 (...)*)(i64 -9223372036854775808)
  %cmp30 = icmp ne i32 %call29, 13
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i32 (...)* bitcast (i32 (i64)* @fne to i32 (...)*)(i64 -9223372036854775807)
  %cmp34 = icmp ne i32 %call33, 13
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i32 (...)* bitcast (i32 (i64)* @fne to i32 (...)*)(i64 1)
  %cmp38 = icmp ne i32 %call37, 13
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i32 (...)* bitcast (i32 (i64)* @fne to i32 (...)*)(i64 9223372036854775807)
  %cmp42 = icmp ne i32 %call41, 13
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i32 (...)* bitcast (i32 (i64)* @flt to i32 (...)*)(i64 0)
  %cmp46 = icmp ne i32 %call45, 140
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i32 (...)* bitcast (i32 (i64)* @flt to i32 (...)*)(i64 -1)
  %cmp50 = icmp ne i32 %call49, 13
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i32 (...)* bitcast (i32 (i64)* @flt to i32 (...)*)(i64 -9223372036854775808)
  %cmp54 = icmp ne i32 %call53, 13
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i32 (...)* bitcast (i32 (i64)* @flt to i32 (...)*)(i64 -9223372036854775807)
  %cmp58 = icmp ne i32 %call57, 13
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i32 (...)* bitcast (i32 (i64)* @flt to i32 (...)*)(i64 1)
  %cmp62 = icmp ne i32 %call61, 140
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i32 (...)* bitcast (i32 (i64)* @flt to i32 (...)*)(i64 9223372036854775807)
  %cmp66 = icmp ne i32 %call65, 140
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i32 (...)* bitcast (i32 (i64)* @fge to i32 (...)*)(i64 0)
  %cmp70 = icmp ne i32 %call69, 13
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i32 (...)* bitcast (i32 (i64)* @fge to i32 (...)*)(i64 -1)
  %cmp74 = icmp ne i32 %call73, 140
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i32 (...)* bitcast (i32 (i64)* @fge to i32 (...)*)(i64 -9223372036854775808)
  %cmp78 = icmp ne i32 %call77, 140
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end76
  %call81 = call i32 (...)* bitcast (i32 (i64)* @fge to i32 (...)*)(i64 -9223372036854775807)
  %cmp82 = icmp ne i32 %call81, 140
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call85 = call i32 (...)* bitcast (i32 (i64)* @fge to i32 (...)*)(i64 1)
  %cmp86 = icmp ne i32 %call85, 13
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %call89 = call i32 (...)* bitcast (i32 (i64)* @fge to i32 (...)*)(i64 9223372036854775807)
  %cmp90 = icmp ne i32 %call89, 13
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end88
  %call93 = call i32 (...)* bitcast (i32 (i64)* @fgt to i32 (...)*)(i64 0)
  %cmp94 = icmp ne i32 %call93, 140
  br i1 %cmp94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end92
  %call97 = call i32 (...)* bitcast (i32 (i64)* @fgt to i32 (...)*)(i64 -1)
  %cmp98 = icmp ne i32 %call97, 140
  br i1 %cmp98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end100:                                        ; preds = %if.end96
  %call101 = call i32 (...)* bitcast (i32 (i64)* @fgt to i32 (...)*)(i64 -9223372036854775808)
  %cmp102 = icmp ne i32 %call101, 140
  br i1 %cmp102, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end100
  call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end100
  %call105 = call i32 (...)* bitcast (i32 (i64)* @fgt to i32 (...)*)(i64 -9223372036854775807)
  %cmp106 = icmp ne i32 %call105, 140
  br i1 %cmp106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end104
  call void @abort() noreturn nounwind
  unreachable

if.end108:                                        ; preds = %if.end104
  %call109 = call i32 (...)* bitcast (i32 (i64)* @fgt to i32 (...)*)(i64 1)
  %cmp110 = icmp ne i32 %call109, 13
  br i1 %cmp110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end108
  call void @abort() noreturn nounwind
  unreachable

if.end112:                                        ; preds = %if.end108
  %call113 = call i32 (...)* bitcast (i32 (i64)* @fgt to i32 (...)*)(i64 9223372036854775807)
  %cmp114 = icmp ne i32 %call113, 13
  br i1 %cmp114, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.end112
  call void @abort() noreturn nounwind
  unreachable

if.end116:                                        ; preds = %if.end112
  %call117 = call i32 (...)* bitcast (i32 (i64)* @fle to i32 (...)*)(i64 0)
  %cmp118 = icmp ne i32 %call117, 13
  br i1 %cmp118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  call void @abort() noreturn nounwind
  unreachable

if.end120:                                        ; preds = %if.end116
  %call121 = call i32 (...)* bitcast (i32 (i64)* @fle to i32 (...)*)(i64 -1)
  %cmp122 = icmp ne i32 %call121, 13
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end120
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end120
  %call125 = call i32 (...)* bitcast (i32 (i64)* @fle to i32 (...)*)(i64 -9223372036854775808)
  %cmp126 = icmp ne i32 %call125, 13
  br i1 %cmp126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end124
  call void @abort() noreturn nounwind
  unreachable

if.end128:                                        ; preds = %if.end124
  %call129 = call i32 (...)* bitcast (i32 (i64)* @fle to i32 (...)*)(i64 -9223372036854775807)
  %cmp130 = icmp ne i32 %call129, 13
  br i1 %cmp130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.end128
  call void @abort() noreturn nounwind
  unreachable

if.end132:                                        ; preds = %if.end128
  %call133 = call i32 (...)* bitcast (i32 (i64)* @fle to i32 (...)*)(i64 1)
  %cmp134 = icmp ne i32 %call133, 140
  br i1 %cmp134, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end132
  call void @abort() noreturn nounwind
  unreachable

if.end136:                                        ; preds = %if.end132
  %call137 = call i32 (...)* bitcast (i32 (i64)* @fle to i32 (...)*)(i64 9223372036854775807)
  %cmp138 = icmp ne i32 %call137, 140
  br i1 %cmp138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end136
  call void @abort() noreturn nounwind
  unreachable

if.end140:                                        ; preds = %if.end136
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
