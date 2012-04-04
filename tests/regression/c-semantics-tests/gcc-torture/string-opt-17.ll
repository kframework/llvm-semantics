; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/string-opt-17.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"foobarbaz\00", align 1
@check2.r = internal global i64 5, align 8
@.str1 = private unnamed_addr constant [3 x i8] c"az\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"baz\00", align 1

define i64 @test1(i8* %s, i64 %i) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  %i.addr = alloca i64, align 8
  store i8* %s, i8** %s.addr, align 8
  store i64 %i, i64* %i.addr, align 8
  %0 = load i8** %s.addr, align 8
  %1 = load i64* %i.addr, align 8
  %inc = add i64 %1, 1
  store i64 %inc, i64* %i.addr, align 8
  %add.ptr = getelementptr inbounds i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i64 %1
  %call = call i8* @strcpy(i8* %0, i8* %add.ptr)
  %2 = load i64* %i.addr, align 8
  ret i64 %2
}

declare i8* @strcpy(i8*, i8*)

define i64 @check2() nounwind uwtable {
entry:
  %0 = load i64* @check2.r, align 8
  %cmp = icmp ne i64 %0, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i64* @check2.r, align 8
  %inc = add i64 %1, 1
  store i64 %inc, i64* @check2.r, align 8
  ret i64 %inc
}

declare void @abort() noreturn

define void @test2(i8* %s) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  %0 = load i8** %s.addr, align 8
  %call = call i64 @check2()
  %add.ptr = getelementptr inbounds i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i64 %call
  %call1 = call i8* @strcpy(i8* %0, i8* %add.ptr)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [10 x i8], align 1
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  %call = call i64 @test1(i8* %arraydecay, i64 7)
  %cmp = icmp ne i64 %call, 8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arraydecay1 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  %call2 = call i32 @memcmp(i8* %arraydecay1, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i64 3)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %arraydecay3 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  call void @test2(i8* %arraydecay3)
  %arraydecay4 = getelementptr inbounds [10 x i8]* %buf, i32 0, i32 0
  %call5 = call i32 @memcmp(i8* %arraydecay4, i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i64 4)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end8:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @memcmp(i8*, i8*, i64)

declare void @exit(i32) noreturn
