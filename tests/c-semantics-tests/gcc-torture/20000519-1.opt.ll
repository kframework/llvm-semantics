; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000519-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define i32 @bar(i32 %a, %struct.__va_list_tag* nocapture %ap) nounwind uwtable {
entry:
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %0 = va_arg %struct.__va_list_tag* %ap, i32
  %cmp = icmp sgt i32 %0, 10
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %add = add nsw i32 %0, %a
  ret i32 %add
}

define i32 @foo(i32 %a, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  br label %do.body.i

do.body.i:                                        ; preds = %do.body.i, %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp.i = icmp sgt i32 %0, 10
  br i1 %cmp.i, label %do.body.i, label %bar.exit

bar.exit:                                         ; preds = %do.body.i
  %add.i = add nsw i32 %0, %a
  ret i32 %add.i
}

declare void @llvm.va_start(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i32, ...)* @foo(i32 1, i32 2, i32 3)
  %cmp = icmp eq i32 %call, 3
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
