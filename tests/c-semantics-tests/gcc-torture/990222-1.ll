; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990222-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@line = global [4 x i8] c"199\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ptr = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 3), i8** %ptr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8** %ptr, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 -1
  store i8* %incdec.ptr, i8** %ptr, align 8
  %1 = load i8* %incdec.ptr, align 1
  %conv = sext i8 %1 to i32
  %add = add nsw i32 %conv, 1
  %conv1 = trunc i32 %add to i8
  store i8 %conv1, i8* %incdec.ptr, align 1
  %conv2 = sext i8 %conv1 to i32
  %cmp = icmp sgt i32 %conv2, 57
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i8** %ptr, align 8
  store i8 48, i8* %2, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 0), align 1
  %conv4 = sext i8 %3 to i32
  %cmp5 = icmp ne i32 %conv4, 50
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %4 = load i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 1), align 1
  %conv7 = sext i8 %4 to i32
  %cmp8 = icmp ne i32 %conv7, 48
  br i1 %cmp8, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %5 = load i8* getelementptr inbounds ([4 x i8]* @line, i32 0, i64 2), align 1
  %conv11 = sext i8 %5 to i32
  %cmp12 = icmp ne i32 %conv11, 48
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false10
  ret i32 0
}

declare void @abort() noreturn nounwind
