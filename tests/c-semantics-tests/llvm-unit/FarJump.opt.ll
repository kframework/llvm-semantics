; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/FarJump.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

@str = private unnamed_addr constant [12 x i8] c"Inside quux\00"
@str9 = private unnamed_addr constant [26 x i8] c"Longjmping from quux: 927\00"
@str10 = private unnamed_addr constant [11 x i8] c"Inside qux\00"
@str11 = private unnamed_addr constant [32 x i8] c"Error: Shouldn't be here in qux\00"
@str12 = private unnamed_addr constant [11 x i8] c"Inside baz\00"
@str13 = private unnamed_addr constant [32 x i8] c"Error: Shouldn't be here in baz\00"
@str14 = private unnamed_addr constant [11 x i8] c"Inside bar\00"
@str15 = private unnamed_addr constant [11 x i8] c"Inside foo\00"
@str16 = private unnamed_addr constant [32 x i8] c"Returning from longjmp into foo\00"

define void @quux(%struct.__jmp_buf_tag* %buf) noreturn nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8]* @str, i64 0, i64 0))
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str9, i64 0, i64 0))
  tail call void @longjmp(%struct.__jmp_buf_tag* %buf, i32 927) noreturn nounwind
  unreachable
}

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define void @qux(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %local_buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %puts = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str10, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %local_buf, i64 0, i64 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @quux(%struct.__jmp_buf_tag* %buf)
  unreachable

if.end:                                           ; preds = %entry
  %puts3 = call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str11, i64 0, i64 0))
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind returns_twice

define void @baz(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %local_buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %puts = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str12, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %local_buf, i64 0, i64 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @qux(%struct.__jmp_buf_tag* %buf)
  br label %if.end

if.else:                                          ; preds = %entry
  %puts3 = call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str13, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @bar(%struct.__jmp_buf_tag* %buf) nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str14, i64 0, i64 0))
  tail call void @baz(%struct.__jmp_buf_tag* %buf)
  ret void
}

define void @foo() nounwind uwtable {
entry:
  %buf = alloca [1 x %struct.__jmp_buf_tag], align 16
  %puts = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str15, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag]* %buf, i64 0, i64 0
  %call1 = call i32 @_setjmp(%struct.__jmp_buf_tag* %arraydecay) nounwind returns_twice
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str14, i64 0, i64 0)) nounwind
  call void @baz(%struct.__jmp_buf_tag* %arraydecay) nounwind
  br label %if.end

if.else:                                          ; preds = %entry
  %puts4 = call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str16, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @foo()
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
