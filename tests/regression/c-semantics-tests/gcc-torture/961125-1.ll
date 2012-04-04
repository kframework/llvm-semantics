; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961125-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c":ab\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca i8*, align 8
  %lim = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %s, align 8
  %0 = load i8** %s, align 8
  %add.ptr = getelementptr inbounds i8* %0, i64 3
  store i8* %add.ptr, i8** %lim, align 8
  %1 = load i8** %s, align 8
  %2 = load i8** %lim, align 8
  %call = call i8* @begfield(i32 58, i8* %1, i8* %2, i32 1, i32 1)
  %3 = load i8** %s, align 8
  %add.ptr1 = getelementptr inbounds i8* %3, i64 2
  %cmp = icmp ne i8* %call, %add.ptr1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

define internal i8* @begfield(i32 %tab, i8* %ptr, i8* %lim, i32 %sword, i32 %schar) nounwind uwtable {
entry:
  %tab.addr = alloca i32, align 4
  %ptr.addr = alloca i8*, align 8
  %lim.addr = alloca i8*, align 8
  %sword.addr = alloca i32, align 4
  %schar.addr = alloca i32, align 4
  store i32 %tab, i32* %tab.addr, align 4
  store i8* %ptr, i8** %ptr.addr, align 8
  store i8* %lim, i8** %lim.addr, align 8
  store i32 %sword, i32* %sword.addr, align 4
  store i32 %schar, i32* %schar.addr, align 4
  %0 = load i32* %tab.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then
  %1 = load i8** %ptr.addr, align 8
  %2 = load i8** %lim.addr, align 8
  %cmp = icmp ult i8* %1, %2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %3 = load i32* %sword.addr, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %sword.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end13

while.body:                                       ; preds = %land.end
  br label %while.cond2

while.cond2:                                      ; preds = %while.body8, %while.body
  %5 = load i8** %ptr.addr, align 8
  %6 = load i8** %lim.addr, align 8
  %cmp3 = icmp ult i8* %5, %6
  br i1 %cmp3, label %land.rhs4, label %land.end7

land.rhs4:                                        ; preds = %while.cond2
  %7 = load i8** %ptr.addr, align 8
  %8 = load i8* %7, align 1
  %conv = sext i8 %8 to i32
  %9 = load i32* %tab.addr, align 4
  %cmp5 = icmp ne i32 %conv, %9
  br label %land.end7

land.end7:                                        ; preds = %land.rhs4, %while.cond2
  %10 = phi i1 [ false, %while.cond2 ], [ %cmp5, %land.rhs4 ]
  br i1 %10, label %while.body8, label %while.end

while.body8:                                      ; preds = %land.end7
  %11 = load i8** %ptr.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %11, i32 1
  store i8* %incdec.ptr, i8** %ptr.addr, align 8
  br label %while.cond2

while.end:                                        ; preds = %land.end7
  %12 = load i8** %ptr.addr, align 8
  %13 = load i8** %lim.addr, align 8
  %cmp9 = icmp ult i8* %12, %13
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %while.end
  %14 = load i8** %ptr.addr, align 8
  %incdec.ptr12 = getelementptr inbounds i8* %14, i32 1
  store i8* %incdec.ptr12, i8** %ptr.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then11, %while.end
  br label %while.cond

while.end13:                                      ; preds = %land.end
  br label %if.end16

if.else:                                          ; preds = %entry
  br label %while.body15

while.body15:                                     ; preds = %if.else, %while.body15
  br label %while.body15

if.end16:                                         ; preds = %while.end13
  %15 = load i8** %ptr.addr, align 8
  %16 = load i32* %schar.addr, align 4
  %idx.ext = sext i32 %16 to i64
  %add.ptr = getelementptr inbounds i8* %15, i64 %idx.ext
  %17 = load i8** %lim.addr, align 8
  %cmp17 = icmp ule i8* %add.ptr, %17
  br i1 %cmp17, label %if.then19, label %if.end22

if.then19:                                        ; preds = %if.end16
  %18 = load i32* %schar.addr, align 4
  %19 = load i8** %ptr.addr, align 8
  %idx.ext20 = sext i32 %18 to i64
  %add.ptr21 = getelementptr inbounds i8* %19, i64 %idx.ext20
  store i8* %add.ptr21, i8** %ptr.addr, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then19, %if.end16
  %20 = load i8** %ptr.addr, align 8
  ret i8* %20
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
