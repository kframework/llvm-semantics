; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* @u, align 4
  store i32 %tmp, i32* %i, align 4
  %tmp1 = load i32* %i, align 4
  %tobool = icmp ne i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32* %i, align 4
  %mul = mul i32 %tmp2, 52783
  %conv = zext i32 %mul to i64
  store i64 %conv, i64* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp3 = load i32* @next_buffer, align 4
  store i32 %tmp3, i32* %buffer, align 4
  %tmp4 = load i32* %buffer, align 4
  %mul5 = mul i32 %tmp4, 52783
  %conv6 = zext i32 %mul5 to i64
  %0 = inttoptr i64 %conv6 to i8*
  store i8* %0, i8** %data, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp7 = load i32* %i, align 4
  %cmp = icmp ult i32 %tmp7, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @bar()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp9 = load i32* %i, align 4
  %inc = add i32 %tmp9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp10 = load i32* @next_buffer, align 4
  store i32 %tmp10, i32* %buffer, align 4
  %tmp11 = load i32* %buffer, align 4
  %mul12 = mul i32 %tmp11, 52783
  %tmp13 = load i32* %offset.addr, align 4
  %add = add i32 %mul12, %tmp13
  %conv14 = zext i32 %add to i64
  store i64 %conv14, i64* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %1 = load i64* %retval
  ret i64 %1
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
