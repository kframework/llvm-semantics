; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/bitfld-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i8, i8, [2 x i8] }

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %bit = alloca %struct.x, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  %unsigned_result = alloca i32, align 4
  %signed_result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 44, i32* %unsigned_result, align 4
  store i32 -13, i32* %signed_result, align 4
  %0 = bitcast %struct.x* %bit to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -16257
  %3 = or i32 %2, 7808
  store i32 %3, i32* %0, align 4
  store i32 61, i32* %u, align 4
  %4 = bitcast %struct.x* %bit to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -128
  %7 = or i32 %6, 115
  store i32 %7, i32* %4, align 4
  store i32 -13, i32* %i, align 4
  %8 = load i32* %i, align 4
  %9 = load i32* %u, align 4
  %rem = urem i32 %8, %9
  %10 = load i32* %unsigned_result, align 4
  %cmp = icmp ne i32 %rem, %10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %11 = load i32* %i, align 4
  %12 = load i32* %u, align 4
  %rem1 = urem i32 %11, %12
  %13 = load i32* %unsigned_result, align 4
  %cmp2 = icmp ne i32 %rem1, %13
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %14 = load i32* %i, align 4
  %15 = bitcast %struct.x* %bit to i32*
  %16 = load i32* %15, align 4
  %17 = lshr i32 %16, 7
  %bf.clear = and i32 %17, 127
  %rem5 = srem i32 %14, %bf.clear
  %18 = load i32* %signed_result, align 4
  %cmp6 = icmp ne i32 %rem5, %18
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %19 = bitcast %struct.x* %bit to i32*
  %20 = load i32* %19, align 4
  %bf.clear9 = and i32 %20, 127
  %21 = shl i32 %bf.clear9, 25
  %bf.val.sext = ashr i32 %21, 25
  %22 = bitcast %struct.x* %bit to i32*
  %23 = load i32* %22, align 4
  %24 = lshr i32 %23, 7
  %bf.clear10 = and i32 %24, 127
  %rem11 = srem i32 %bf.val.sext, %bf.clear10
  %25 = load i32* %signed_result, align 4
  %cmp12 = icmp ne i32 %rem11, %25
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end8
  %26 = load i32* %i, align 4
  %27 = bitcast %struct.x* %bit to i32*
  %28 = load i32* %27, align 4
  %29 = lshr i32 %28, 7
  %bf.clear15 = and i32 %29, 127
  %rem16 = urem i32 %26, %bf.clear15
  %30 = load i32* %unsigned_result, align 4
  %cmp17 = icmp ne i32 %rem16, %30
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end14
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end14
  %31 = bitcast %struct.x* %bit to i32*
  %32 = load i32* %31, align 4
  %bf.clear20 = and i32 %32, 127
  %33 = shl i32 %bf.clear20, 25
  %bf.val.sext21 = ashr i32 %33, 25
  %34 = bitcast %struct.x* %bit to i32*
  %35 = load i32* %34, align 4
  %36 = lshr i32 %35, 7
  %bf.clear22 = and i32 %36, 127
  %rem23 = urem i32 %bf.val.sext21, %bf.clear22
  %37 = load i32* %unsigned_result, align 4
  %cmp24 = icmp ne i32 %rem23, %37
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end19
  ret i32 0
}

declare void @abort() noreturn nounwind
