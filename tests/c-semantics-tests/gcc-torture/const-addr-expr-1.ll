; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/const-addr-expr-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i8* }

@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@Upgrade_items = global [3 x %struct.foo] [%struct.foo { i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0) }, %struct.foo { i32 2, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0) }, %struct.foo zeroinitializer], align 16
@Upgd_minor_ID = global i32* bitcast (i8* getelementptr (i8* bitcast ([3 x %struct.foo]* @Upgrade_items to i8*), i64 16) to i32*), align 8
@Upgd_minor_ID1 = global i32* getelementptr inbounds ([3 x %struct.foo]* @Upgrade_items, i32 0, i32 0, i32 0), align 8

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32** @Upgd_minor_ID, align 8
  %1 = load i32* %0, align 4
  %cmp = icmp ne i32 %1, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32** @Upgd_minor_ID1, align 8
  %3 = load i32* %2, align 4
  %cmp1 = icmp ne i32 %3, 1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
