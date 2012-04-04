; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i8* null, align 8
@n = common global i32 0, align 4

define void @foo() nounwind uwtable {
entry:
  %p = alloca i8*, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %0 = load i8** @q, align 8
  store i8* %0, i8** %p, align 8
  %1 = load i8** %p, align 8
  %arrayidx = getelementptr inbounds i8* %1, i64 2
  %2 = load i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  store volatile i32 %conv, i32* @n, align 4
  %3 = load i8** @q, align 8
  store i8* %3, i8** %p, align 8
  %4 = load i8** %p, align 8
  %arrayidx1 = getelementptr inbounds i8* %4, i64 2
  %5 = load i8* %arrayidx1, align 1
  %conv2 = sext i8 %5 to i32
  store volatile i32 %conv2, i32* @n, align 4
  %6 = load i8** @q, align 8
  store i8* %6, i8** %p, align 8
  %7 = load i8** %p, align 8
  %arrayidx3 = getelementptr inbounds i8* %7, i64 2
  %8 = load i8* %arrayidx3, align 1
  %conv4 = sext i8 %8 to i32
  store volatile i32 %conv4, i32* @n, align 4
  %9 = load i8** @q, align 8
  store i8* %9, i8** %p, align 8
  %10 = load i8** %p, align 8
  %arrayidx5 = getelementptr inbounds i8* %10, i64 2
  %11 = load i8* %arrayidx5, align 1
  %conv6 = sext i8 %11 to i32
  store volatile i32 %conv6, i32* @n, align 4
  %12 = load i8** @q, align 8
  store i8* %12, i8** %p, align 8
  %13 = load i8** %p, align 8
  %arrayidx7 = getelementptr inbounds i8* %13, i64 2
  %14 = load i8* %arrayidx7, align 1
  %conv8 = sext i8 %14 to i32
  store volatile i32 %conv8, i32* @n, align 4
  %15 = load i8** @q, align 8
  store i8* %15, i8** %p, align 8
  %16 = load i8** %p, align 8
  %arrayidx9 = getelementptr inbounds i8* %16, i64 2
  %17 = load i8* %arrayidx9, align 1
  %conv10 = sext i8 %17 to i32
  store volatile i32 %conv10, i32* @n, align 4
  %18 = load i8** @q, align 8
  store i8* %18, i8** %p, align 8
  %19 = load i8** %p, align 8
  %arrayidx11 = getelementptr inbounds i8* %19, i64 2
  %20 = load i8* %arrayidx11, align 1
  %conv12 = sext i8 %20 to i32
  store volatile i32 %conv12, i32* @n, align 4
  %21 = load i8** @q, align 8
  store i8* %21, i8** %p, align 8
  %22 = load i8** %p, align 8
  %arrayidx13 = getelementptr inbounds i8* %22, i64 2
  %23 = load i8* %arrayidx13, align 1
  %conv14 = sext i8 %23 to i32
  store volatile i32 %conv14, i32* @n, align 4
  %24 = load i8** @q, align 8
  store i8* %24, i8** %p, align 8
  %25 = load i8** %p, align 8
  %arrayidx15 = getelementptr inbounds i8* %25, i64 2
  %26 = load i8* %arrayidx15, align 1
  %conv16 = sext i8 %26 to i32
  store volatile i32 %conv16, i32* @n, align 4
  %27 = load i8** @q, align 8
  store i8* %27, i8** %p, align 8
  %28 = load i8** %p, align 8
  %arrayidx17 = getelementptr inbounds i8* %28, i64 2
  %29 = load i8* %arrayidx17, align 1
  %conv18 = sext i8 %29 to i32
  store volatile i32 %conv18, i32* @n, align 4
  %30 = load i8** @q, align 8
  store i8* %30, i8** %p, align 8
  %31 = load i8** %p, align 8
  %arrayidx19 = getelementptr inbounds i8* %31, i64 2
  %32 = load i8* %arrayidx19, align 1
  %conv20 = sext i8 %32 to i32
  store volatile i32 %conv20, i32* @n, align 4
  br label %for.cond

return:                                           ; No predecessors!
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
