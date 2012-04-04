; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pending-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @dummy(i32* %x, i32 %y) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32, align 4
  store i32* %x, i32** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %number_columns = alloca i32, align 4
  %cnt0 = alloca i32, align 4
  %cnt1 = alloca i32, align 4
  %i = alloca i32, align 4
  %A1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 9, i32* %number_columns, align 4
  store i32 0, i32* %cnt0, align 4
  store i32 0, i32* %cnt1, align 4
  %0 = load i32* %number_columns, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp ne i32 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %cmp1 = icmp eq i32 %2, 1
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  call void (...)* bitcast (void (i32*, i32)* @dummy to void (...)*)(i32* %A1, i32 %3)
  %4 = load i32* %cnt0, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %cnt0, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %sub2 = sub nsw i32 %5, 1
  call void (...)* bitcast (void (i32*, i32)* @dummy to void (...)*)(i32* %A1, i32 %sub2)
  %6 = load i32* %cnt1, align 4
  %inc3 = add nsw i32 %6, 1
  store i32 %inc3, i32* %cnt1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i, align 4
  %dec = add nsw i32 %7, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32* %cnt0, align 4
  %cmp4 = icmp ne i32 %8, 1
  br i1 %cmp4, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %9 = load i32* %cnt1, align 4
  %cmp5 = icmp ne i32 %9, 7
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %lor.lhs.false, %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
