; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @h(i32 %x, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  store i32 %x, i32* %x.addr, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %0 = load i32* %x.addr, align 4
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 5, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  %1 = load %struct.__va_list_tag** %ap.addr, align 8
  %2 = va_arg %struct.__va_list_tag* %1, i32
  %cmp = icmp ne i32 %2, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb
  %3 = load %struct.__va_list_tag** %ap.addr, align 8
  %4 = va_arg %struct.__va_list_tag* %3, i32
  %cmp1 = icmp ne i32 %4, 4
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %sw.bb
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %return

sw.bb2:                                           ; preds = %entry
  %5 = load %struct.__va_list_tag** %ap.addr, align 8
  %6 = va_arg %struct.__va_list_tag* %5, i32
  %cmp3 = icmp ne i32 %6, 9
  br i1 %cmp3, label %if.then6, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %sw.bb2
  %7 = load %struct.__va_list_tag** %ap.addr, align 8
  %8 = va_arg %struct.__va_list_tag* %7, i32
  %cmp5 = icmp ne i32 %8, 10
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %lor.lhs.false4, %sw.bb2
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %lor.lhs.false4
  br label %return

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %if.end7, %if.end
  ret void
}

declare void @abort() noreturn nounwind

define void @f1(i32 %i, i64 %j, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  store i64 %j, i64* %j.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @h(i32 %0, %struct.__va_list_tag* %arraydecay2)
  %1 = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i64* %j.addr, align 8
  %cmp3 = icmp ne i64 %2, 2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, i32 %j, i32 %k, i64 %l, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %l.addr = alloca i64, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i64 %l, i64* %l.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @h(i32 %0, %struct.__va_list_tag* %arraydecay2)
  %1 = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %1, 5
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %j.addr, align 4
  %cmp3 = icmp ne i32 %2, 6
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %3 = load i32* %k.addr, align 4
  %cmp5 = icmp ne i32 %3, 7
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i64* %l.addr, align 8
  %cmp7 = icmp ne i64 %4, 8
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay89 = bitcast %struct.__va_list_tag* %arraydecay8 to i8*
  call void @llvm.va_end(i8* %arraydecay89)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, i64, ...)* @f1(i32 1, i64 2, i32 3, i32 4)
  call void (i32, i32, i32, i64, ...)* @f2(i32 5, i32 6, i32 7, i64 8, i32 9, i32 10)
  ret i32 0
}
