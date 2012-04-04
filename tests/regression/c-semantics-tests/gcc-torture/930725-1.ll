; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930725-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@v = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

define i8* @g() nounwind uwtable {
entry:
  ret i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)
}

define i8* @f() nounwind uwtable {
entry:
  %0 = load i32* @v, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i8* @g()
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), %cond.false ]
  ret i8* %cond
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* @v, align 4
  %call = call i8* @f()
  %call1 = call i32 @strcmp(i8* %call, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0)) nounwind readonly
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
