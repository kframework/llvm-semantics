; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/PR640.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [7 x i8] c"ERROR\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"All done.\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @test_stdarg(i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0))
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0))
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @test_stdarg(i32 %r) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca i32, align 4
  %c1 = alloca i8, align 1
  %c2 = alloca i8, align 1
  store i32 %r, i32* %r.addr, align 4
  store i8 1, i8* %c1, align 1
  store i8 2, i8* %c2, align 1
  %0 = bitcast i32* %r.addr to i8*
  %1 = load i8* %c1, align 1
  %conv = sext i8 %1 to i32
  %2 = load i8* %c2, align 1
  %conv1 = sext i8 %2 to i32
  %call = call i32 (i8*, ...)* @test_stdarg_va(i8* %0, i32 %conv, i64 1981891429, i32 %conv1, i32* %r.addr)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %3 = bitcast i32* %r.addr to i8*
  %4 = load i8* %c1, align 1
  %conv3 = sext i8 %4 to i32
  %5 = load i8* %c2, align 1
  %conv4 = sext i8 %5 to i32
  %call5 = call i32 (i8*, ...)* @test_stdarg_builtin_va(i8* %3, i32 %conv3, i64 1981891433, i32 %conv4, i32* %r.addr)
  %cmp6 = icmp ne i32 %call5, 1
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

if.end9:                                          ; preds = %if.end
  %6 = load i32* %r.addr, align 4
  %and = and i32 %6, 1
  store i32 %and, i32* %retval
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then
  %7 = load i32* %retval
  ret i32 %7
}

declare i32 @printf(i8*, ...)

define internal i32 @test_stdarg_va(i8* %p1, ...) nounwind uwtable {
entry:
  %p1.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %l = alloca i64, align 8
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %p2 = alloca i8*, align 8
  store i8* %p1, i8** %p1.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %0, i32* %i1, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  store i64 %1, i64* %l, align 8
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay4, i32
  store i32 %2, i32* %i2, align 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay5, i8*
  store i8* %3, i8** %p2, align 8
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay67 = bitcast %struct.__va_list_tag* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  %4 = load i8** %p1.addr, align 8
  %5 = load i8** %p2, align 8
  %cmp = icmp eq i8* %4, %5
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %6 = load i32* %i1, align 4
  %cmp8 = icmp eq i32 %6, 1
  br i1 %cmp8, label %land.lhs.true9, label %land.end

land.lhs.true9:                                   ; preds = %land.lhs.true
  %7 = load i64* %l, align 8
  %cmp10 = icmp eq i64 %7, 1981891429
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true9
  %8 = load i32* %i2, align 4
  %cmp11 = icmp eq i32 %8, 2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true9, %land.lhs.true, %entry
  %9 = phi i1 [ false, %land.lhs.true9 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp11, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  ret i32 %land.ext
}

define internal i32 @test_stdarg_builtin_va(i8* %p1, ...) nounwind uwtable {
entry:
  %p1.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %l = alloca i64, align 8
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %p2 = alloca i8*, align 8
  store i8* %p1, i8** %p1.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %0, i32* %i1, align 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %1 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  store i64 %1, i64* %l, align 8
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay4, i32
  store i32 %2, i32* %i2, align 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay5, i8*
  store i8* %3, i8** %p2, align 8
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay67 = bitcast %struct.__va_list_tag* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  %4 = load i8** %p1.addr, align 8
  %5 = load i8** %p2, align 8
  %cmp = icmp eq i8* %4, %5
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %6 = load i32* %i1, align 4
  %cmp8 = icmp eq i32 %6, 1
  br i1 %cmp8, label %land.lhs.true9, label %land.end

land.lhs.true9:                                   ; preds = %land.lhs.true
  %7 = load i64* %l, align 8
  %cmp10 = icmp eq i64 %7, 1981891433
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true9
  %8 = load i32* %i2, align 4
  %cmp11 = icmp eq i32 %8, 2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true9, %land.lhs.true, %entry
  %9 = phi i1 [ false, %land.lhs.true9 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp11, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  ret i32 %land.ext
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind
