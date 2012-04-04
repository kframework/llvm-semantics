; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr34415.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Bbb:\00", align 1

define i8* @foo(i8* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca i8*, align 8
  %end = alloca i8*, align 8
  %len = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i32 1, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end13, %entry
  %0 = load i8** %p.addr, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  store i32 %conv, i32* %c, align 4
  %2 = load i32* %c, align 4
  %cmp = icmp sge i32 %2, 97
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.cond
  %3 = load i32* %c, align 4
  %cmp2 = icmp sle i32 %3, 122
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %4 = load i32* %c, align 4
  %sub = sub nsw i32 %4, 97
  %add = add nsw i32 %sub, 65
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.cond
  %5 = load i32* %c, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %5, %cond.false ]
  store i32 %cond, i32* %c, align 4
  %6 = load i32* %c, align 4
  %cmp4 = icmp eq i32 %6, 66
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %7 = load i8** %p.addr, align 8
  store i8* %7, i8** %end, align 8
  br label %if.end13

if.else:                                          ; preds = %cond.end
  %8 = load i32* %c, align 4
  %cmp6 = icmp eq i32 %8, 65
  br i1 %cmp6, label %if.then8, label %if.else12

if.then8:                                         ; preds = %if.else
  %9 = load i8** %p.addr, align 8
  store i8* %9, i8** %end, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then8
  %10 = load i8** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %10, i32 1
  store i8* %incdec.ptr, i8** %p.addr, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %11 = load i8** %p.addr, align 8
  %12 = load i8* %11, align 1
  %conv9 = sext i8 %12 to i32
  %cmp10 = icmp eq i32 %conv9, 43
  br i1 %cmp10, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end

if.else12:                                        ; preds = %if.else
  br label %for.end

if.end:                                           ; preds = %do.end
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then
  %13 = load i8** %p.addr, align 8
  %incdec.ptr14 = getelementptr inbounds i8* %13, i32 1
  store i8* %incdec.ptr14, i8** %p.addr, align 8
  %14 = load i32* %len, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else12
  %15 = load i32* %len, align 4
  %cmp15 = icmp sgt i32 %15, 2
  br i1 %cmp15, label %land.lhs.true17, label %if.end22

land.lhs.true17:                                  ; preds = %for.end
  %16 = load i8** %p.addr, align 8
  %17 = load i8* %16, align 1
  %conv18 = sext i8 %17 to i32
  %cmp19 = icmp eq i32 %conv18, 58
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true17
  %18 = load i8** %end, align 8
  store i8* %18, i8** %p.addr, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %land.lhs.true17, %for.end
  %19 = load i8** %p.addr, align 8
  ret i8* %19
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %input = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8** %input, align 8
  %0 = load i8** %input, align 8
  %call = call i8* @foo(i8* %0)
  %1 = load i8** %input, align 8
  %add.ptr = getelementptr inbounds i8* %1, i64 2
  %cmp = icmp ne i8* %call, %add.ptr
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}
