; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011126-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"aab\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %out = alloca [4 x i8], align 1
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [4 x i8]* %out, i32 0, i32 0
  %call = call i8* @test(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* %arraydecay)
  ret i32 0
}

define internal i8* @test(i8* %in, i8* %out) nounwind uwtable {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i8* %in, i8** %in.addr, align 8
  store i8* %out, i8** %out.addr, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %if.end18
  %0 = load i8** %in.addr, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 97
  br i1 %cmp, label %if.then, label %if.end18

if.then:                                          ; preds = %while.body
  %2 = load i8** %in.addr, align 8
  %add.ptr = getelementptr inbounds i8* %2, i64 1
  store i8* %add.ptr, i8** %p, align 8
  br label %while.cond2

while.cond2:                                      ; preds = %while.body6, %if.then
  %3 = load i8** %p, align 8
  %4 = load i8* %3, align 1
  %conv3 = sext i8 %4 to i32
  %cmp4 = icmp eq i32 %conv3, 120
  br i1 %cmp4, label %while.body6, label %while.end

while.body6:                                      ; preds = %while.cond2
  %5 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %5, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  br label %while.cond2

while.end:                                        ; preds = %while.cond2
  %6 = load i8** %p, align 8
  %7 = load i8* %6, align 1
  %conv7 = sext i8 %7 to i32
  %cmp8 = icmp eq i32 %conv7, 98
  br i1 %cmp8, label %if.then10, label %if.end

if.then10:                                        ; preds = %while.end
  %8 = load i8** %p, align 8
  ret i8* %8

if.end:                                           ; preds = %while.end
  br label %while.cond11

while.cond11:                                     ; preds = %while.body14, %if.end
  %9 = load i8** %in.addr, align 8
  %10 = load i8** %p, align 8
  %cmp12 = icmp ult i8* %9, %10
  br i1 %cmp12, label %while.body14, label %while.end17

while.body14:                                     ; preds = %while.cond11
  %11 = load i8** %in.addr, align 8
  %incdec.ptr15 = getelementptr inbounds i8* %11, i32 1
  store i8* %incdec.ptr15, i8** %in.addr, align 8
  %12 = load i8* %11, align 1
  %13 = load i8** %out.addr, align 8
  %incdec.ptr16 = getelementptr inbounds i8* %13, i32 1
  store i8* %incdec.ptr16, i8** %out.addr, align 8
  store i8 %12, i8* %13, align 1
  br label %while.cond11

while.end17:                                      ; preds = %while.cond11
  br label %if.end18

if.end18:                                         ; preds = %while.end17, %while.body
  br label %while.body
}
