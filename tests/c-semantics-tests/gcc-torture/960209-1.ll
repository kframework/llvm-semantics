; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960209-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type { i8 }

@yabba = global i32 1, align 4
@an_array = common global [5 x %struct.a_struct] zeroinitializer, align 1
@a_ptr = common global %struct.a_struct* null, align 8

define i32 @f(i32, i64 %b) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i8, align 1
  %b.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %p = alloca i64, align 8
  %q = alloca i64, align 8
  %r = alloca i64, align 8
  %s = alloca i64, align 8
  %a = trunc i32 %0 to i8
  store i8 %a, i8* %a.addr, align 1
  store i64 %b, i64* %b.addr, align 8
  %1 = load i64* %b.addr, align 8
  %cmp = icmp ne i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end21

if.then:                                          ; preds = %entry
  %2 = load i32* @yabba, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %3 = load i64* %b.addr, align 8
  %div = udiv i64 4000000, %3
  store i64 %div, i64* %s, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %if.end
  %4 = load i64* %i, align 8
  %cmp2 = icmp slt i64 %4, 11
  br i1 %cmp2, label %for.body, label %for.end20

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %j, align 8
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %5 = load i64* %j, align 8
  %cmp4 = icmp slt i64 %5, 256
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond3
  %6 = load i64* %p, align 8
  %7 = load i64* %s, align 8
  %sub = sub nsw i64 %6, %7
  %cmp6 = icmp slt i64 %sub, 0
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body5
  %8 = load i64* %s, align 8
  %sub7 = sub nsw i64 0, %8
  br label %cond.end

cond.false:                                       ; preds = %for.body5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub7, %cond.true ], [ 0, %cond.false ]
  %9 = load i64* %q, align 8
  %10 = load i64* %s, align 8
  %sub8 = sub nsw i64 %9, %10
  %cmp9 = icmp slt i64 %sub8, 0
  br i1 %cmp9, label %cond.true10, label %cond.false12

cond.true10:                                      ; preds = %cond.end
  %11 = load i64* %s, align 8
  %sub11 = sub nsw i64 0, %11
  br label %cond.end13

cond.false12:                                     ; preds = %cond.end
  %12 = load i64* %q, align 8
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true10
  %cond14 = phi i64 [ %sub11, %cond.true10 ], [ %12, %cond.false12 ]
  %cmp15 = icmp slt i64 %cond, %cond14
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %cond.end13
  %13 = load i64* %i, align 8
  store i64 %13, i64* %r, align 8
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %cond.end13
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %14 = load i64* %j, align 8
  %inc = add nsw i64 %14, 1
  store i64 %inc, i64* %j, align 8
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %15 = load i64* %i, align 8
  %inc19 = add nsw i64 %15, 1
  store i64 %inc19, i64* %i, align 8
  br label %for.cond

for.end20:                                        ; preds = %for.cond
  br label %if.end21

if.end21:                                         ; preds = %for.end20, %entry
  %16 = load i32* @yabba, align 4
  %tobool22 = icmp ne i32 %16, 0
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  store i32 0, i32* %retval
  br label %return

if.end24:                                         ; preds = %if.end21
  %17 = load i8* %a.addr, align 1
  %idxprom = zext i8 %17 to i64
  %arrayidx = getelementptr inbounds [5 x %struct.a_struct]* @an_array, i32 0, i64 %idxprom
  store %struct.a_struct* %arrayidx, %struct.a_struct** @a_ptr, align 8
  %18 = load i64* %r, align 8
  %conv = trunc i64 %18 to i8
  %19 = load %struct.a_struct** @a_ptr, align 8
  %a_character = getelementptr inbounds %struct.a_struct* %19, i32 0, i32 0
  store i8 %conv, i8* %a_character, align 1
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end24, %if.then23, %if.then1
  %20 = load i32* %retval
  ret i32 %20
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32, i64)* @f to i32 (...)*)(i32 1, i64 0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
