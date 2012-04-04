; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global i32 17, align 4
@y = global i32 5, align 4
@f.x = internal global i32 0, align 4
@f.x1 = internal global i32 0, align 4
@g.x = internal global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"01y=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"02y=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"03y=%d\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"04y=%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %y = alloca i32, align 4
  %0 = load i32* @f.x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f.x, align 4
  %1 = load i32* @f.x1, align 4
  %add = add nsw i32 %1, 2
  store i32 %add, i32* @f.x1, align 4
  %2 = load i32* @f.x1, align 4
  store i32 %2, i32* %y, align 4
  %3 = load i32* %y, align 4
  %mul = mul nsw i32 %3, 2
  %4 = load i32* @f.x, align 4
  %mul1 = mul nsw i32 %4, 3
  %add2 = add nsw i32 %mul, %mul1
  ret i32 %add2
}

define i32 @g() nounwind uwtable {
entry:
  %0 = load i32* @g.x, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @g.x, align 4
  %1 = load i32* @g.x, align 4
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  %0 = load i32* @y, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %0)
  store i32 6, i32* %y, align 4
  %1 = load i32* %y, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 %1)
  %2 = load i32* @y, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %2)
  %3 = load i32* %y, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i32 %3)
  %call4 = call i32 @f()
  %call5 = call i32 @f()
  %call6 = call i32 @g()
  %call7 = call i32 @g()
  %call8 = call i32 @g()
  %call9 = call i32 @f()
  %call10 = call i32 @g()
  %add = add nsw i32 %call9, %call10
  ret i32 %add
}

declare i32 @printf(i8*, ...)
