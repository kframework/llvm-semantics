; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.big = type { [32 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@main.x = internal global %struct.big { [32 x i8] c"abc\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @f(%struct.big* byval align 8 %x, i8* %s, ...) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %s, i8** %s.addr, align 8
  %a = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %arrayidx = getelementptr inbounds [32 x i8]* %a, i32 0, i64 0
  %0 = load i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 97
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %a2 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [32 x i8]* %a2, i32 0, i64 1
  %1 = load i8* %arrayidx3, align 1
  %conv4 = sext i8 %1 to i32
  %cmp5 = icmp ne i32 %conv4, 98
  br i1 %cmp5, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false
  %a8 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %arrayidx9 = getelementptr inbounds [32 x i8]* %a8, i32 0, i64 2
  %2 = load i8* %arrayidx9, align 1
  %conv10 = sext i8 %2 to i32
  %cmp11 = icmp ne i32 %conv10, 99
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false7
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay13 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay13)
  %arraydecay14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay14, i32
  %cmp15 = icmp ne i32 %3, 42
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end
  %arraydecay19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay19, i32
  %cmp20 = icmp ne i32 %4, 120
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end18
  %arraydecay24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay24, i32
  %cmp25 = icmp ne i32 %5, 0
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end23
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end23
  %arraydecay29 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay2930 = bitcast %struct.__va_list_tag* %arraydecay29 to i8*
  call void @llvm.va_end(i8* %arraydecay2930)
  ret void
}

declare void @abort() noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (%struct.big*, i8*, ...)* @f(%struct.big* byval align 8 @main.x, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 42, i32 120, i32 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
