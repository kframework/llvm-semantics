; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = internal global i32 0, align 4
@next_buffer = internal global i32 0, align 4

define i64 @foo(i32 %offset) nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %offset.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32, align 4
  %x = alloca i32, align 4
  %data = alloca i8*, align 8
  store i32 %offset, i32* %offset.addr, align 4
  %0 = load i32* @u, align 4
  store i32 %0, i32* %i, align 4
  %1 = load i32* %i, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32* %i, align 4
  %mul = mul i32 %2, 52783
  %conv = zext i32 %mul to i64
  store i64 %conv, i64* %retval
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32* @next_buffer, align 4
  store i32 %3, i32* %buffer, align 4
  %4 = load i32* %buffer, align 4
  %mul1 = mul i32 %4, 52783
  %conv2 = zext i32 %mul1 to i64
  %5 = inttoptr i64 %conv2 to i8*
  store i8* %5, i8** %data, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32* %i, align 4
  %cmp = icmp ult i32 %6, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @bar()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32* @next_buffer, align 4
  store i32 %8, i32* %buffer, align 4
  %9 = load i32* %buffer, align 4
  %mul4 = mul i32 %9, 52783
  %10 = load i32* %offset.addr, align 4
  %add = add i32 %mul4, %10
  %conv5 = zext i32 %add to i64
  store i64 %conv5, i64* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %11 = load i64* %retval
  ret i64 %11
}

define void @bar() nounwind uwtable {
entry:
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @foo(i32 3)
  %cmp = icmp ne i64 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  store i32 1, i32* @next_buffer, align 4
  %call1 = call i64 @foo(i32 2)
  %cmp2 = icmp ne i64 %call1, 52785
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
