; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930718-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtx_def = type { i8, [3 x i8] }

define void @f2() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %foo = alloca %struct.rtx_def, align 4
  %bar = alloca %struct.rtx_def*, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.rtx_def* %foo to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -2
  %3 = or i32 %2, 1
  store i32 %3, i32* %0, align 4
  %4 = bitcast %struct.rtx_def* %foo to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -3
  store i32 %6, i32* %4, align 4
  %call = call %struct.rtx_def* (...)* bitcast (%struct.rtx_def* (%struct.rtx_def*)* @f to %struct.rtx_def* (...)*)(%struct.rtx_def* %foo)
  store %struct.rtx_def* %call, %struct.rtx_def** %bar, align 8
  %7 = load %struct.rtx_def** %bar, align 8
  %cmp = icmp ne %struct.rtx_def* %7, %foo
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %8 = load %struct.rtx_def** %bar, align 8
  %9 = bitcast %struct.rtx_def* %8 to i32*
  %10 = load i32* %9, align 4
  %11 = lshr i32 %10, 1
  %bf.clear = and i32 %11, 1
  %12 = shl i32 %bf.clear, 31
  %bf.val.sext = ashr i32 %12, 31
  %cmp1 = icmp ne i32 %bf.val.sext, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %13 = load i32* %retval
  ret i32 %13
}

define internal %struct.rtx_def* @f(%struct.rtx_def* %orig) nounwind uwtable {
entry:
  %retval = alloca %struct.rtx_def*, align 8
  %orig.addr = alloca %struct.rtx_def*, align 8
  store %struct.rtx_def* %orig, %struct.rtx_def** %orig.addr, align 8
  %0 = load %struct.rtx_def** %orig.addr, align 8
  %1 = bitcast %struct.rtx_def* %0 to i32*
  %2 = load i32* %1, align 4
  %bf.clear = and i32 %2, 1
  %3 = shl i32 %bf.clear, 31
  %bf.val.sext = ashr i32 %3, 31
  %tobool = icmp ne i32 %bf.val.sext, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load %struct.rtx_def** %orig.addr, align 8
  %5 = bitcast %struct.rtx_def* %4 to i32*
  %6 = load i32* %5, align 4
  %7 = lshr i32 %6, 1
  %bf.clear1 = and i32 %7, 1
  %8 = shl i32 %bf.clear1, 31
  %bf.val.sext2 = ashr i32 %8, 31
  %tobool3 = icmp ne i32 %bf.val.sext2, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %9 = load %struct.rtx_def** %orig.addr, align 8
  store %struct.rtx_def* %9, %struct.rtx_def** %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %10 = load %struct.rtx_def** %orig.addr, align 8
  %11 = bitcast %struct.rtx_def* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = and i32 %12, -3
  %14 = or i32 %13, 2
  store i32 %14, i32* %11, align 4
  %15 = load %struct.rtx_def** %orig.addr, align 8
  store %struct.rtx_def* %15, %struct.rtx_def** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %16 = load %struct.rtx_def** %retval
  ret %struct.rtx_def* %16
}

declare void @exit(i32) noreturn nounwind
