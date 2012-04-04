; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.addr = internal global [19 x i8] c"10.11.12.13:/hello\00", align 16

define i64 @in_aton(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  store i8* %x, i8** %x.addr, align 8
  ret i64 168496141
}

define i64 @root_nfs_parse_addr(i8* %name) nounwind uwtable {
entry:
  %name.addr = alloca i8*, align 8
  %addr = alloca i64, align 8
  %octets = alloca i32, align 4
  %cp = alloca i8*, align 8
  %cq = alloca i8*, align 8
  store i8* %name, i8** %name.addr, align 8
  store i32 0, i32* %octets, align 4
  %0 = load i8** %name.addr, align 8
  store i8* %0, i8** %cq, align 8
  store i8* %0, i8** %cp, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end24, %entry
  %1 = load i32* %octets, align 4
  %cmp = icmp slt i32 %1, 4
  br i1 %cmp, label %while.body, label %while.end25

while.body:                                       ; preds = %while.cond
  br label %while.cond1

while.cond1:                                      ; preds = %while.body7, %while.body
  %2 = load i8** %cp, align 8
  %3 = load i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp2 = icmp sge i32 %conv, 48
  br i1 %cmp2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond1
  %4 = load i8** %cp, align 8
  %5 = load i8* %4, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp sle i32 %conv4, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond1
  %6 = phi i1 [ false, %while.cond1 ], [ %cmp5, %land.rhs ]
  br i1 %6, label %while.body7, label %while.end

while.body7:                                      ; preds = %land.end
  %7 = load i8** %cp, align 8
  %incdec.ptr = getelementptr inbounds i8* %7, i32 1
  store i8* %incdec.ptr, i8** %cp, align 8
  br label %while.cond1

while.end:                                        ; preds = %land.end
  %8 = load i8** %cp, align 8
  %9 = load i8** %cq, align 8
  %cmp8 = icmp eq i8* %8, %9
  br i1 %cmp8, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %10 = load i8** %cp, align 8
  %11 = load i8** %cq, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %10 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %11 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp10 = icmp sgt i64 %sub.ptr.sub, 3
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.end
  br label %while.end25

if.end:                                           ; preds = %lor.lhs.false
  %12 = load i8** %cp, align 8
  %13 = load i8* %12, align 1
  %conv12 = sext i8 %13 to i32
  %cmp13 = icmp eq i32 %conv12, 46
  br i1 %cmp13, label %if.then18, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.end
  %14 = load i32* %octets, align 4
  %cmp16 = icmp eq i32 %14, 3
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false15, %if.end
  %15 = load i32* %octets, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %octets, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %lor.lhs.false15
  %16 = load i32* %octets, align 4
  %cmp20 = icmp slt i32 %16, 4
  br i1 %cmp20, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.end19
  %17 = load i8** %cp, align 8
  %incdec.ptr23 = getelementptr inbounds i8* %17, i32 1
  store i8* %incdec.ptr23, i8** %cp, align 8
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.end19
  %18 = load i8** %cp, align 8
  store i8* %18, i8** %cq, align 8
  br label %while.cond

while.end25:                                      ; preds = %if.then, %while.cond
  %19 = load i32* %octets, align 4
  %cmp26 = icmp eq i32 %19, 4
  br i1 %cmp26, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.end25
  %20 = load i8** %cp, align 8
  %21 = load i8* %20, align 1
  %conv28 = sext i8 %21 to i32
  %cmp29 = icmp eq i32 %conv28, 58
  br i1 %cmp29, label %if.then35, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %land.lhs.true
  %22 = load i8** %cp, align 8
  %23 = load i8* %22, align 1
  %conv32 = sext i8 %23 to i32
  %cmp33 = icmp eq i32 %conv32, 0
  br i1 %cmp33, label %if.then35, label %if.else

if.then35:                                        ; preds = %lor.lhs.false31, %land.lhs.true
  %24 = load i8** %cp, align 8
  %25 = load i8* %24, align 1
  %conv36 = sext i8 %25 to i32
  %cmp37 = icmp eq i32 %conv36, 58
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.then35
  %26 = load i8** %cp, align 8
  %incdec.ptr40 = getelementptr inbounds i8* %26, i32 1
  store i8* %incdec.ptr40, i8** %cp, align 8
  store i8 0, i8* %26, align 1
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.then35
  %27 = load i8** %name.addr, align 8
  %call = call i64 @in_aton(i8* %27)
  store i64 %call, i64* %addr, align 8
  %28 = load i8** %name.addr, align 8
  %29 = load i8** %cp, align 8
  %call42 = call i8* @strcpy(i8* %28, i8* %29) nounwind
  br label %if.end43

if.else:                                          ; preds = %lor.lhs.false31, %while.end25
  store i64 -1, i64* %addr, align 8
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.end41
  %30 = load i64* %addr, align 8
  ret i64 %30
}

declare i8* @strcpy(i8*, i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %result = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @root_nfs_parse_addr(i8* getelementptr inbounds ([19 x i8]* @main.addr, i32 0, i32 0))
  store i64 %call, i64* %result, align 8
  %0 = load i64* %result, align 8
  %cmp = icmp ne i64 %0, 168496141
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
