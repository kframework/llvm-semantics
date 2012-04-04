; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.str = private unnamed_addr constant [11 x i8] c"foo { xx }\00", align 1

define void @foo(i8* %p1, i8** %p2) nounwind uwtable {
entry:
  %p1.addr = alloca i8*, align 8
  %p2.addr = alloca i8**, align 8
  store i8* %p1, i8** %p1.addr, align 8
  store i8** %p2, i8*** %p2.addr, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %str = alloca [11 x i8], align 1
  %ptr = alloca i8*, align 8
  store i32 0, i32* %retval
  %0 = bitcast [11 x i8]* %str to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([11 x i8]* @main.str, i32 0, i32 0), i64 11, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [11 x i8]* %str, i32 0, i32 0
  %add.ptr = getelementptr inbounds i8* %arraydecay, i64 5
  store i8* %add.ptr, i8** %ptr, align 8
  %1 = load i8** %ptr, align 8
  call void @foo(i8* %1, i8** %ptr)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i8** %ptr, align 8
  %3 = load i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i8** %ptr, align 8
  %5 = load i8* %4, align 1
  %conv1 = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv1, 13
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %6 = load i8** %ptr, align 8
  %7 = load i8* %6, align 1
  %conv3 = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv3, 32
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %8 = phi i1 [ true, %land.rhs ], [ %cmp4, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %9 = phi i1 [ false, %while.cond ], [ %8, %lor.end ]
  br i1 %9, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %10 = load i8** %ptr, align 8
  %incdec.ptr = getelementptr inbounds i8* %10, i32 1
  store i8* %incdec.ptr, i8** %ptr, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
