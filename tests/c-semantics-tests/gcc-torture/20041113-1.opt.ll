; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@a = global double 4.000000e+01, align 8

define void @test(i32 %x, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp4 = icmp eq i32 %1, 2
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp8 = icmp eq i32 %2, 3
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp12 = icmp eq i32 %3, 4
  br i1 %cmp12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.end10
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  %0 = load double* @a, align 8, !tbaa !0
  %div = fdiv double %0, 1.000000e+01
  %conv = fptosi double %div to i32
  tail call void (i32, ...)* @test(i32 undef, i32 1, i32 2, i32 3, i32 %conv)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
