; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001130-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@which_alternative = internal global i32 3, align 4
@.str = private unnamed_addr constant [10 x i8] c"mov\09%1,%0\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"ld\09%1,%0\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"st\09%1,%0\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"foo\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %retval
  %call = call i8* @output_25()
  store i8* %call, i8** %s, align 8
  %0 = load i8** %s, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 0
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 115
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

define internal i8* @output_25() nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %0 = load i32* @which_alternative, align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  store i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8** %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  %call = call i8* @i960_output_ldconst()
  store i8* %call, i8** %retval
  br label %return

sw.bb2:                                           ; preds = %entry
  store i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8** %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  store i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i8** %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i8* null, i8** %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %1 = load i8** %retval
  ret i8* %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal i8* @i960_output_ldconst() nounwind uwtable {
entry:
  ret i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0)
}
