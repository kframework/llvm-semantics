; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [11 x i8], i32 }

@.str = private unnamed_addr constant [11 x i8] c"0123456789\00", align 1
@cell = common global %struct.s zeroinitializer, align 4

define i32 @check(i64 %p.coerce0, i64 %p.coerce1) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.s, align 8
  %0 = bitcast %struct.s* %p to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  store i64 %p.coerce0, i64* %1
  %2 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  store i64 %p.coerce1, i64* %2
  %flag = getelementptr inbounds %struct.s* %p, i32 0, i32 1
  %3 = load i32* %flag, align 4
  %cmp = icmp ne i32 %3, 99
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %text = getelementptr inbounds %struct.s* %p, i32 0, i32 0
  %arraydecay = getelementptr inbounds [11 x i8]* %text, i32 0, i32 0
  %call = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0)) nounwind readonly
  store i32 %call, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

declare i32 @strcmp(i8*, i8*) nounwind readonly

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 99, i32* getelementptr inbounds (%struct.s* @cell, i32 0, i32 1), align 4
  %call = call i8* @strcpy(i8* getelementptr inbounds (%struct.s* @cell, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0)) nounwind
  %0 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.s* @cell to { i64, i64 }*), i32 0, i32 0), align 1
  %1 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.s* @cell to { i64, i64 }*), i32 0, i32 1), align 1
  %call1 = call i32 @check(i64 %0, i64 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare i8* @strcpy(i8*, i8*) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
