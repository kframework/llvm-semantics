; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000314-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@arg0 = internal global [5 x i8] c"arg0\00", align 1
@arg1 = internal global [5 x i8] c"arg1\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (...)* bitcast (void (i8*, i8*)* @attr_eq to void (...)*)(i8* getelementptr inbounds ([5 x i8]* @arg0, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @arg1, i32 0, i32 0))
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @attr_eq(i8* %name, i8* %value) nounwind uwtable {
entry:
  %name.addr = alloca i8*, align 8
  %value.addr = alloca i8*, align 8
  store i8* %name, i8** %name.addr, align 8
  store i8* %value, i8** %value.addr, align 8
  %0 = load i8** %name.addr, align 8
  %call = call i8* @attr_string(i8* %0)
  %1 = load i8** %value.addr, align 8
  %call1 = call i8* @attr_string(i8* %1)
  call void @attr_rtx(i8* %call, i8* %call1)
  ret void
}

declare void @exit(i32) noreturn

define internal void @attr_rtx(i8* %varg0, i8* %varg1) nounwind uwtable {
entry:
  %varg0.addr = alloca i8*, align 8
  %varg1.addr = alloca i8*, align 8
  store i8* %varg0, i8** %varg0.addr, align 8
  store i8* %varg1, i8** %varg1.addr, align 8
  %0 = load i8** %varg0.addr, align 8
  %cmp = icmp ne i8* %0, getelementptr inbounds ([5 x i8]* @arg0, i32 0, i32 0)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i8** %varg1.addr, align 8
  %cmp1 = icmp ne i8* %1, getelementptr inbounds ([5 x i8]* @arg1, i32 0, i32 0)
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end3:                                          ; preds = %if.end
  ret void
}

define internal i8* @attr_string(i8* %str) nounwind uwtable {
entry:
  %str.addr = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  %0 = load i8** %str.addr, align 8
  ret i8* %0
}

declare void @abort() noreturn
