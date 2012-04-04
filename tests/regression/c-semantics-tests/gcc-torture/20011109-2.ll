; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011109-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"foo\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c1 = alloca i8*, align 8
  %c2 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %c1, align 8
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %c2, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load i8** %c1, align 8
  %arrayidx = getelementptr inbounds i8* %2, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %4 = load i32* %i, align 4
  %idxprom1 = sext i32 %4 to i64
  %5 = load i8** %c2, align 8
  %arrayidx2 = getelementptr inbounds i8* %5, i64 %idxprom1
  %6 = load i8* %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp ne i32 %conv, %conv3
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
