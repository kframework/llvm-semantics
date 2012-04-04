; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.ScanfState = type { i8*, [1 x %struct.__va_list_tag], i32 }

define void @dummy(%struct.__va_list_tag* nocapture %vap) nounwind uwtable {
entry:
  %0 = va_arg %struct.__va_list_tag* %vap, i32
  %cmp = icmp eq i32 %0, 1234
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @test(i32 %fmt, ...) nounwind uwtable {
entry:
  %state = alloca %struct.ScanfState, align 8
  %arraydecay = getelementptr inbounds %struct.ScanfState* %state, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp.i = icmp eq i32 %0, 1234
  br i1 %cmp.i, label %dummy.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

dummy.exit:                                       ; preds = %entry
  call void @llvm.va_end(i8* %arraydecay1)
  call void @llvm.va_start(i8* %arraydecay1)
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp.i15 = icmp eq i32 %1, 1234
  br i1 %cmp.i15, label %dummy.exit17, label %if.then.i16

if.then.i16:                                      ; preds = %dummy.exit
  call void @abort() noreturn nounwind
  unreachable

dummy.exit17:                                     ; preds = %dummy.exit
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @test(i32 undef, i32 1234)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
