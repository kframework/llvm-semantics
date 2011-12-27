; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010123-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i8* }

@.str = private unnamed_addr constant [10 x i8] c"hey there\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca %struct.s*, align 8
  %.compoundliteral = alloca %struct.s, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %value = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 0
  store i32 3, i32* %value, align 4
  %string = getelementptr inbounds %struct.s* %.compoundliteral, i32 0, i32 1
  store i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8** %string, align 8
  store %struct.s* %.compoundliteral, %struct.s** %t, align 8
  %tmp2 = load %struct.s** %t, align 8
  %value3 = getelementptr inbounds %struct.s* %tmp2, i32 0, i32 0
  %tmp4 = load i32* %value3, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.body
  %tmp6 = load %struct.s** %t, align 8
  %value7 = getelementptr inbounds %struct.s* %tmp6, i32 0, i32 0
  store i32 4, i32* %value7, align 4
  %tmp8 = load %struct.s** %t, align 8
  %value9 = getelementptr inbounds %struct.s* %tmp8, i32 0, i32 0
  %tmp10 = load i32* %value9, align 4
  %cmp11 = icmp ne i32 %tmp10, 4
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end13
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
