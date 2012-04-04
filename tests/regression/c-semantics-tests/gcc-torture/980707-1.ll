; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980707-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buildargv.arglist = internal global [256 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" a b\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1

define i8** @buildargv(i8* %input) nounwind uwtable {
entry:
  %input.addr = alloca i8*, align 8
  %numargs = alloca i32, align 4
  store i8* %input, i8** %input.addr, align 8
  store i32 0, i32* %numargs, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end21
  br label %while.cond1

while.cond1:                                      ; preds = %while.body3, %while.body
  %0 = load i8** %input.addr, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %while.body3, label %while.end

while.body3:                                      ; preds = %while.cond1
  %2 = load i8** %input.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %2, i32 1
  store i8* %incdec.ptr, i8** %input.addr, align 8
  br label %while.cond1

while.end:                                        ; preds = %while.cond1
  %3 = load i8** %input.addr, align 8
  %4 = load i8* %3, align 1
  %conv4 = sext i8 %4 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  br label %while.end23

if.end:                                           ; preds = %while.end
  %5 = load i8** %input.addr, align 8
  %6 = load i32* %numargs, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %numargs, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i32 0, i64 %idxprom
  store i8* %5, i8** %arrayidx, align 8
  br label %while.cond7

while.cond7:                                      ; preds = %while.body14, %if.end
  %7 = load i8** %input.addr, align 8
  %8 = load i8* %7, align 1
  %conv8 = sext i8 %8 to i32
  %cmp9 = icmp ne i32 %conv8, 32
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond7
  %9 = load i8** %input.addr, align 8
  %10 = load i8* %9, align 1
  %conv11 = sext i8 %10 to i32
  %cmp12 = icmp ne i32 %conv11, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond7
  %11 = phi i1 [ false, %while.cond7 ], [ %cmp12, %land.rhs ]
  br i1 %11, label %while.body14, label %while.end16

while.body14:                                     ; preds = %land.end
  %12 = load i8** %input.addr, align 8
  %incdec.ptr15 = getelementptr inbounds i8* %12, i32 1
  store i8* %incdec.ptr15, i8** %input.addr, align 8
  br label %while.cond7

while.end16:                                      ; preds = %land.end
  %13 = load i8** %input.addr, align 8
  %14 = load i8* %13, align 1
  %conv17 = sext i8 %14 to i32
  %cmp18 = icmp eq i32 %conv17, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %while.end16
  br label %while.end23

if.end21:                                         ; preds = %while.end16
  %15 = load i8** %input.addr, align 8
  %incdec.ptr22 = getelementptr inbounds i8* %15, i32 1
  store i8* %incdec.ptr22, i8** %input.addr, align 8
  store i8 0, i8* %15, align 1
  br label %while.body

while.end23:                                      ; preds = %if.then20, %if.then
  %16 = load i32* %numargs, align 4
  %idxprom24 = sext i32 %16 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i32 0, i64 %idxprom24
  store i8* null, i8** %arrayidx25, align 8
  ret i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i32 0, i32 0)
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %args = alloca i8**, align 8
  %input = alloca [256 x i8], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [256 x i8]* %input, i32 0, i32 0
  %call = call i8* @strcpy(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)) nounwind
  %arraydecay1 = getelementptr inbounds [256 x i8]* %input, i32 0, i32 0
  %call2 = call i8** @buildargv(i8* %arraydecay1)
  store i8** %call2, i8*** %args, align 8
  %0 = load i8*** %args, align 8
  %arrayidx = getelementptr inbounds i8** %0, i64 0
  %1 = load i8** %arrayidx, align 8
  %call3 = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)) nounwind readonly
  %tobool = icmp ne i32 %call3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i8*** %args, align 8
  %arrayidx4 = getelementptr inbounds i8** %2, i64 1
  %3 = load i8** %arrayidx4, align 8
  %call5 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) nounwind readonly
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end
  %4 = load i8*** %args, align 8
  %arrayidx9 = getelementptr inbounds i8** %4, i64 2
  %5 = load i8** %arrayidx9, align 8
  %cmp = icmp ne i8* %5, null
  br i1 %cmp, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end8
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare i8* @strcpy(i8*, i8*) nounwind

declare i32 @strcmp(i8*, i8*) nounwind readonly

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
