; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-trap-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@ap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@f = common global float 0.000000e+00, align 4

define noalias [1 x %struct.__va_list_tag]* @foo() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

define void @bar(i32 %i, ...) nounwind uwtable {
entry:
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @ap to i8*))
  %call = call [1 x %struct.__va_list_tag]* @foo()
  unreachable
}

declare void @llvm.va_start(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @bar(i32 1, i32 0)
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn
