; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980506-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"bind\00", align 1
@lookup_table = common global [257 x i8] zeroinitializer, align 16

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 (...)* bitcast (i32 (i8*)* @build_lookup to i32 (...)*)(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  %cmp = icmp ne i32 %call, 4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @build_lookup(i8* %pattern) nounwind uwtable {
entry:
  %pattern.addr = alloca i8*, align 8
  %m = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 8
  %0 = load i8** %pattern.addr, align 8
  %call = call i64 @strlen(i8* %0) nounwind readonly
  %sub = sub i64 %call, 1
  %conv = trunc i64 %sub to i32
  store i32 %conv, i32* %m, align 4
  %1 = load i32* %m, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %m, align 4
  %2 = trunc i32 %inc to i8
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([257 x i8]* @lookup_table, i32 0, i32 0), i8 %2, i64 257, i32 1, i1 false)
  %3 = load i32* %m, align 4
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare i64 @strlen(i8*) nounwind readonly

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
