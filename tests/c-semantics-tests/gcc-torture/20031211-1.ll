; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031211-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a = type { i8, [3 x i8] }

@main.a = private unnamed_addr constant %struct.a { i8 0, [3 x i8] undef }, align 4
@x = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.a, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.a* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.a* @main.a, i32 0, i32 0), i64 4, i32 4, i1 false)
  store i32 48879, i32* @x, align 4
  %1 = load i32* @x, align 4
  %2 = bitcast %struct.a* %a to i32*
  %3 = load i32* %2, align 4
  %bf.clear = and i32 %3, 1
  %or = or i32 %bf.clear, %1
  %bf.value = and i32 %or, 1
  %4 = bitcast %struct.a* %a to i32*
  %5 = and i32 %bf.value, 1
  %6 = load i32* %4, align 4
  %7 = and i32 %6, -2
  %8 = or i32 %7, %5
  store i32 %8, i32* %4, align 4
  %9 = bitcast %struct.a* %a to i32*
  %10 = load i32* %9, align 4
  %bf.clear1 = and i32 %10, 1
  %cmp = icmp ne i32 %bf.clear1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %11 = load i32* %retval
  ret i32 %11
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
