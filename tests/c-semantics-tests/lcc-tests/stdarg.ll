; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/stdarg.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { [4 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@x = global %struct.node { [4 x i32] [i32 1, i32 2, i32 3, i32 4] }, align 8
@.str = private unnamed_addr constant [8 x i8] c"test 1\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"test %s\0A\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"test %d%c\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"%s%s %d%c\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"te\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"st\00", align 1
@.str7 = private unnamed_addr constant [10 x i8] c"%s%s %f%c\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c"%b %b %b %b %b %b\0A\00", align 1
@.str9 = private unnamed_addr constant [14 x i8] c"{%d %d %d %d}\00", align 1
@.str10 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0), i32 3, i32 10)
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i32 4, i32 10)
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), double 5.000000e+00, i32 10)
  %0 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 0), align 1
  %1 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 1), align 1
  %2 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 0), align 1
  %3 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 1), align 1
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0), i64 %0, i64 %1, i64 %2, i64 %3, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x)
  ret i32 0
}

define void @print(i8* %fmt, ...) nounwind uwtable {
entry:
  %fmt.addr = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x = alloca %struct.node, align 4
  store i8* %fmt, i8** %fmt.addr, align 8
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8** %fmt.addr, align 8
  %1 = load i8* %0, align 1
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8** %fmt.addr, align 8
  %3 = load i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 37
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %4 = load i8** %fmt.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %4, i32 1
  store i8* %incdec.ptr, i8** %fmt.addr, align 8
  %5 = load i8* %incdec.ptr, align 1
  %conv3 = sext i8 %5 to i32
  switch i32 %conv3, label %sw.default [
    i32 98, label %sw.bb
    i32 99, label %sw.bb11
    i32 100, label %sw.bb14
    i32 119, label %sw.bb17
    i32 115, label %sw.bb20
    i32 102, label %sw.bb23
  ]

sw.bb:                                            ; preds = %if.then
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 32
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %sw.bb
  %6 = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 3
  %reg_save_area = load i8** %6
  %7 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %8 = bitcast i8* %7 to %struct.node*
  %9 = add i32 %gp_offset, 16
  store i32 %9, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %sw.bb
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay4, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %10 = bitcast i8* %overflow_arg_area to %struct.node*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 16
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.node* [ %8, %vaarg.in_reg ], [ %10, %vaarg.in_mem ]
  %11 = bitcast %struct.node* %x to i8*
  %12 = bitcast %struct.node* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 16, i32 4, i1 false)
  %a = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %a, i32 0, i64 0
  %13 = load i32* %arrayidx, align 4
  %a5 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %arrayidx6 = getelementptr inbounds [4 x i32]* %a5, i32 0, i64 1
  %14 = load i32* %arrayidx6, align 4
  %a7 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %arrayidx8 = getelementptr inbounds [4 x i32]* %a7, i32 0, i64 2
  %15 = load i32* %arrayidx8, align 4
  %a9 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %arrayidx10 = getelementptr inbounds [4 x i32]* %a9, i32 0, i64 3
  %16 = load i32* %arrayidx10, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str9, i32 0, i32 0), i32 %13, i32 %14, i32 %15, i32 %16)
  br label %sw.epilog

sw.bb11:                                          ; preds = %if.then
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %17 = va_arg %struct.__va_list_tag* %arraydecay12, i32
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 %17)
  br label %sw.epilog

sw.bb14:                                          ; preds = %if.then
  %arraydecay15 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %18 = va_arg %struct.__va_list_tag* %arraydecay15, i32
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32 %18)
  br label %sw.epilog

sw.bb17:                                          ; preds = %if.then
  %arraydecay18 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %19 = va_arg %struct.__va_list_tag* %arraydecay18, i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), i32 %19)
  br label %sw.epilog

sw.bb20:                                          ; preds = %if.then
  %arraydecay21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = va_arg %struct.__va_list_tag* %arraydecay21, i8*
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0), i8* %20)
  br label %sw.epilog

sw.bb23:                                          ; preds = %if.then
  %arraydecay24 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %21 = va_arg %struct.__va_list_tag* %arraydecay24, double
  %conv25 = fptosi double %21 to i32
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32 %conv25)
  br label %sw.epilog

sw.default:                                       ; preds = %if.then
  %22 = load i8** %fmt.addr, align 8
  %23 = load i8* %22, align 1
  %conv27 = sext i8 %23 to i32
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 %conv27)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb23, %sw.bb20, %sw.bb17, %sw.bb14, %sw.bb11, %vaarg.end
  br label %if.end

if.else:                                          ; preds = %for.body
  %24 = load i8** %fmt.addr, align 8
  %25 = load i8* %24, align 1
  %conv29 = sext i8 %25 to i32
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 %conv29)
  br label %if.end

if.end:                                           ; preds = %if.else, %sw.epilog
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %26 = load i8** %fmt.addr, align 8
  %incdec.ptr31 = getelementptr inbounds i8* %26, i32 1
  store i8* %incdec.ptr31, i8** %fmt.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay32 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay3233 = bitcast %struct.__va_list_tag* %arraydecay32 to i8*
  call void @llvm.va_end(i8* %arraydecay3233)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)

declare void @llvm.va_end(i8*) nounwind
