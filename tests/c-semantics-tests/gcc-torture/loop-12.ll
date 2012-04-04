; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-12.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global i8* null, align 8
@.str = private unnamed_addr constant [5 x i8] c"abc\0A\00", align 1

define void @foo() nounwind uwtable {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @is_end_of_statement() nounwind readonly
  %tobool = icmp ne i32 %call, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %0 = load i8** @p, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** @p, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define internal i32 @is_end_of_statement() nounwind uwtable readonly {
entry:
  %0 = load i8** @p, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 10
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8** @p, align 8
  %3 = load i8* %2, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv2, 59
  br i1 %cmp3, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %4 = load i8** @p, align 8
  %5 = load i8* %4, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 33
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %entry
  %6 = phi i1 [ true, %lor.lhs.false ], [ true, %entry ], [ %cmp6, %lor.rhs ]
  %lor.ext = zext i1 %6 to i32
  ret i32 %lor.ext
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** @p, align 8
  call void @foo()
  ret i32 0
}
