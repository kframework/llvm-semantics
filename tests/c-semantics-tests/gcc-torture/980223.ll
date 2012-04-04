; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980223.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.object = type { i8*, i64 }

@nil = common global i32 0, align 4
@cons1 = global [2 x %struct.object] [%struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@cons2 = global [2 x %struct.object] [%struct.object { i8* bitcast ([2 x %struct.object]* @cons1 to i8*), i64 64 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@main.x = private unnamed_addr constant %struct.object { i8* bitcast ([2 x %struct.object]* @cons2 to i8*), i64 64 }, align 8
@main.y = private unnamed_addr constant %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, align 8

define { i8*, i64 } @bar(i8* %blah.coerce0, i64 %blah.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.object, align 8
  %blah = alloca %struct.object, align 8
  %0 = bitcast %struct.object* %blah to { i8*, i64 }*
  %1 = getelementptr { i8*, i64 }* %0, i32 0, i32 0
  store i8* %blah.coerce0, i8** %1
  %2 = getelementptr { i8*, i64 }* %0, i32 0, i32 1
  store i64 %blah.coerce1, i64* %2
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = bitcast %struct.object* %retval to { i8*, i64 }*
  %4 = load { i8*, i64 }* %3, align 1
  ret { i8*, i64 } %4
}

declare void @abort() noreturn nounwind

define { i8*, i64 } @foo(i8* %x.coerce0, i64 %x.coerce1, i8* %y.coerce0, i64 %y.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.object, align 8
  %x = alloca %struct.object, align 8
  %y = alloca %struct.object, align 8
  %z = alloca %struct.object, align 8
  %coerce = alloca %struct.object, align 8
  %0 = bitcast %struct.object* %x to { i8*, i64 }*
  %1 = getelementptr { i8*, i64 }* %0, i32 0, i32 0
  store i8* %x.coerce0, i8** %1
  %2 = getelementptr { i8*, i64 }* %0, i32 0, i32 1
  store i64 %x.coerce1, i64* %2
  %3 = bitcast %struct.object* %y to { i8*, i64 }*
  %4 = getelementptr { i8*, i64 }* %3, i32 0, i32 0
  store i8* %y.coerce0, i8** %4
  %5 = getelementptr { i8*, i64 }* %3, i32 0, i32 1
  store i64 %y.coerce1, i64* %5
  %addr = getelementptr inbounds %struct.object* %x, i32 0, i32 0
  %6 = load i8** %addr, align 8
  %7 = bitcast i8* %6 to %struct.object*
  %8 = bitcast %struct.object* %z to i8*
  %9 = bitcast %struct.object* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 16, i32 8, i1 false)
  %type = getelementptr inbounds %struct.object* %z, i32 0, i32 1
  %10 = load i64* %type, align 8
  %and = and i64 %10, 64
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %addr1 = getelementptr inbounds %struct.object* %z, i32 0, i32 0
  %11 = load i8** %addr1, align 8
  %add.ptr = getelementptr inbounds i8* %11, i64 16
  %12 = bitcast i8* %add.ptr to %struct.object*
  %13 = bitcast %struct.object* %y to i8*
  %14 = bitcast %struct.object* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 16, i32 8, i1 false)
  %addr2 = getelementptr inbounds %struct.object* %z, i32 0, i32 0
  %15 = load i8** %addr2, align 8
  %16 = bitcast i8* %15 to %struct.object*
  %17 = bitcast %struct.object* %z to i8*
  %18 = bitcast %struct.object* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 16, i32 8, i1 false)
  %type3 = getelementptr inbounds %struct.object* %z, i32 0, i32 1
  %19 = load i64* %type3, align 8
  %and4 = and i64 %19, 64
  %tobool5 = icmp ne i64 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %20 = bitcast %struct.object* %y to { i8*, i64 }*
  %21 = getelementptr { i8*, i64 }* %20, i32 0, i32 0
  %22 = load i8** %21, align 1
  %23 = getelementptr { i8*, i64 }* %20, i32 0, i32 1
  %24 = load i64* %23, align 1
  %call = call { i8*, i64 } @bar(i8* %22, i64 %24)
  %25 = bitcast %struct.object* %coerce to { i8*, i64 }*
  %26 = getelementptr { i8*, i64 }* %25, i32 0, i32 0
  %27 = extractvalue { i8*, i64 } %call, 0
  store i8* %27, i8** %26, align 1
  %28 = getelementptr { i8*, i64 }* %25, i32 0, i32 1
  %29 = extractvalue { i8*, i64 } %call, 1
  store i64 %29, i64* %28, align 1
  %30 = bitcast %struct.object* %y to i8*
  %31 = bitcast %struct.object* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 16, i32 8, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %entry
  %32 = bitcast %struct.object* %retval to i8*
  %33 = bitcast %struct.object* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 16, i32 8, i1 false)
  %34 = bitcast %struct.object* %retval to { i8*, i64 }*
  %35 = load { i8*, i64 }* %34, align 1
  ret { i8*, i64 } %35
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.object, align 8
  %y = alloca %struct.object, align 8
  %three = alloca %struct.object, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.object* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.object* @main.x to i8*), i64 16, i32 8, i1 false)
  %1 = bitcast %struct.object* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.object* @main.y to i8*), i64 16, i32 8, i1 false)
  %2 = bitcast %struct.object* %x to { i8*, i64 }*
  %3 = getelementptr { i8*, i64 }* %2, i32 0, i32 0
  %4 = load i8** %3, align 1
  %5 = getelementptr { i8*, i64 }* %2, i32 0, i32 1
  %6 = load i64* %5, align 1
  %7 = bitcast %struct.object* %y to { i8*, i64 }*
  %8 = getelementptr { i8*, i64 }* %7, i32 0, i32 0
  %9 = load i8** %8, align 1
  %10 = getelementptr { i8*, i64 }* %7, i32 0, i32 1
  %11 = load i64* %10, align 1
  %call = call { i8*, i64 } @foo(i8* %4, i64 %6, i8* %9, i64 %11)
  %12 = bitcast %struct.object* %three to { i8*, i64 }*
  %13 = getelementptr { i8*, i64 }* %12, i32 0, i32 0
  %14 = extractvalue { i8*, i64 } %call, 0
  store i8* %14, i8** %13, align 1
  %15 = getelementptr { i8*, i64 }* %12, i32 0, i32 1
  %16 = extractvalue { i8*, i64 } %call, 1
  store i64 %16, i64* %15, align 1
  ret i32 0
}
