; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"ee\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"*e\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i8*)* @special_format to i32 (...)*)(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 (...)* bitcast (i32 (i8*)* @special_format to i32 (...)*)(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @special_format(i8* %fmt) nounwind uwtable {
entry:
  %fmt.addr = alloca i8*, align 8
  store i8* %fmt, i8** %fmt.addr, align 8
  %0 = load i8** %fmt.addr, align 8
  %call = call i8* @strchr(i8* %0, i32 42) nounwind readonly
  %cmp = icmp ne i8* %call, null
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8** %fmt.addr, align 8
  %call1 = call i8* @strchr(i8* %1, i32 86) nounwind readonly
  %cmp2 = icmp ne i8* %call1, null
  br i1 %cmp2, label %lor.end, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %2 = load i8** %fmt.addr, align 8
  %call4 = call i8* @strchr(i8* %2, i32 83) nounwind readonly
  %cmp5 = icmp ne i8* %call4, null
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false3
  %3 = load i8** %fmt.addr, align 8
  %call6 = call i8* @strchr(i8* %3, i32 110) nounwind readonly
  %cmp7 = icmp ne i8* %call6, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false3, %lor.lhs.false, %entry
  %4 = phi i1 [ true, %lor.lhs.false3 ], [ true, %lor.lhs.false ], [ true, %entry ], [ %cmp7, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  ret i32 %lor.ext
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare i8* @strchr(i8*, i32) nounwind readonly
