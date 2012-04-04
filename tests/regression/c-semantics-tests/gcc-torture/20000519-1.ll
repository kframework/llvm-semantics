; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000519-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define i32 @bar(i32 %a, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  %b = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load %struct.__va_list_tag** %ap.addr, align 8
  %1 = va_arg %struct.__va_list_tag* %0, i32
  store i32 %1, i32* %b, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %2 = load i32* %b, align 4
  %cmp = icmp sgt i32 %2, 10
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %3 = load i32* %a.addr, align 4
  %4 = load i32* %b, align 4
  %add = add nsw i32 %3, %4
  ret i32 %add
}

define i32 @foo(i32 %a, ...) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a, i32* %a.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %a.addr, align 4
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %call = call i32 @bar(i32 %0, %struct.__va_list_tag* %arraydecay2)
  ret i32 %call
}

declare void @llvm.va_start(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (i32, ...)* @foo(i32 1, i32 2, i32 3)
  %cmp = icmp ne i32 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
