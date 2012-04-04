; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.ScanfState = type { i8*, [1 x %struct.__va_list_tag], i32 }

define void @dummy(%struct.__va_list_tag* %vap) nounwind uwtable {
entry:
  %vap.addr = alloca %struct.__va_list_tag*, align 8
  store %struct.__va_list_tag* %vap, %struct.__va_list_tag** %vap.addr, align 8
  %0 = load %struct.__va_list_tag** %vap.addr, align 8
  %1 = va_arg %struct.__va_list_tag* %0, i32
  %cmp = icmp ne i32 %1, 1234
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @test(i32 %fmt, ...) nounwind uwtable {
entry:
  %fmt.addr = alloca i32, align 4
  %state = alloca %struct.ScanfState, align 8
  %statep = alloca %struct.ScanfState*, align 8
  store i32 %fmt, i32* %fmt.addr, align 4
  store %struct.ScanfState* %state, %struct.ScanfState** %statep, align 8
  %0 = load %struct.ScanfState** %statep, align 8
  %ap = getelementptr inbounds %struct.ScanfState* %0, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %1 = load %struct.ScanfState** %statep, align 8
  %ap2 = getelementptr inbounds %struct.ScanfState* %1, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap2, i32 0, i32 0
  call void @dummy(%struct.__va_list_tag* %arraydecay3)
  %2 = load %struct.ScanfState** %statep, align 8
  %ap4 = getelementptr inbounds %struct.ScanfState* %2, i32 0, i32 1
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  %ap7 = getelementptr inbounds %struct.ScanfState* %state, i32 0, i32 1
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap7, i32 0, i32 0
  %arraydecay89 = bitcast %struct.__va_list_tag* %arraydecay8 to i8*
  call void @llvm.va_start(i8* %arraydecay89)
  %ap10 = getelementptr inbounds %struct.ScanfState* %state, i32 0, i32 1
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap10, i32 0, i32 0
  call void @dummy(%struct.__va_list_tag* %arraydecay11)
  %ap12 = getelementptr inbounds %struct.ScanfState* %state, i32 0, i32 1
  %arraydecay13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap12, i32 0, i32 0
  %arraydecay1314 = bitcast %struct.__va_list_tag* %arraydecay13 to i8*
  call void @llvm.va_end(i8* %arraydecay1314)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @test(i32 456, i32 1234)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
