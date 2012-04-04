; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021015-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_list = global [1 x i8] c"1", align 1

define void @g(i8* %p, i8* %list, i32 %length, i8** %elementPtr, i8** %nextPtr) nounwind uwtable {
entry:
  %p.addr = alloca i8*, align 8
  %list.addr = alloca i8*, align 8
  %length.addr = alloca i32, align 4
  %elementPtr.addr = alloca i8**, align 8
  %nextPtr.addr = alloca i8**, align 8
  store i8* %p, i8** %p.addr, align 8
  store i8* %list, i8** %list.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i8** %elementPtr, i8*** %elementPtr.addr, align 8
  store i8** %nextPtr, i8*** %nextPtr.addr, align 8
  %0 = load i8*** %nextPtr.addr, align 8
  %1 = load i8** %0, align 8
  %cmp = icmp ne i8* %1, getelementptr inbounds ([1 x i8]* @g_list, i32 0, i32 0)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i8*** %nextPtr.addr, align 8
  %3 = load i8** %2, align 8
  store i8 0, i8* %3, align 1
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %list = alloca i8*, align 8
  %element = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %prevList = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([1 x i8]* @g_list, i32 0, i32 0), i8** %list, align 8
  store i32 100, i32* %length, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8** %list, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8** %list, align 8
  store i8* %2, i8** %prevList, align 8
  %3 = load i8** %list, align 8
  %4 = load i32* %length, align 4
  call void @g(i8* null, i8* %3, i32 %4, i8** %element, i8** %list)
  %5 = load i8** %list, align 8
  %6 = load i8** %prevList, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %5 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %6 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %7 = load i32* %length, align 4
  %conv2 = sext i32 %7 to i64
  %sub = sub nsw i64 %conv2, %sub.ptr.sub
  %conv3 = trunc i64 %sub to i32
  store i32 %conv3, i32* %length, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
