; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000818-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@temporary_obstack = common global i8* null, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ch = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @yylex()
  store i32 %call, i32* %ch, align 4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @yylex() nounwind uwtable {
entry:
  %ch = alloca i32, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end3, %entry
  %call = call i32 @input()
  store i32 %call, i32* %ch, align 4
  %0 = load i32* %ch, align 4
  %call1 = call i32 @ISALNUM(i32 %0)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.cond
  %1 = load i32* %ch, align 4
  call void @obstack_1grow(i8** @temporary_obstack, i32 %1)
  br label %if.end3

if.else:                                          ; preds = %for.cond
  %2 = load i32* %ch, align 4
  %cmp = icmp ne i32 %2, 95
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  br label %for.end

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  br label %for.cond

for.end:                                          ; preds = %if.then2
  %3 = load i32* %ch, align 4
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind

define internal i32 @input() nounwind uwtable {
entry:
  ret i32 0
}

define internal i32 @ISALNUM(i32 %ch) nounwind uwtable {
entry:
  %ch.addr = alloca i32, align 4
  store i32 %ch, i32* %ch.addr, align 4
  %0 = load i32* %ch.addr, align 4
  %cmp = icmp sge i32 %0, 65
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* %ch.addr, align 4
  %cmp1 = icmp sle i32 %1, 90
  br i1 %cmp1, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32* %ch.addr, align 4
  %cmp2 = icmp sge i32 %2, 97
  br i1 %cmp2, label %land.lhs.true3, label %lor.rhs

land.lhs.true3:                                   ; preds = %lor.lhs.false
  %3 = load i32* %ch.addr, align 4
  %cmp4 = icmp sle i32 %3, 122
  br i1 %cmp4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true3, %lor.lhs.false
  %4 = load i32* %ch.addr, align 4
  %cmp5 = icmp sge i32 %4, 48
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %5 = load i32* %ch.addr, align 4
  %cmp6 = icmp sle i32 %5, 48
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %6 = phi i1 [ false, %lor.rhs ], [ %cmp6, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true3, %land.lhs.true
  %7 = phi i1 [ true, %land.lhs.true3 ], [ true, %land.lhs.true ], [ %6, %land.end ]
  %lor.ext = zext i1 %7 to i32
  ret i32 %lor.ext
}

define internal void @obstack_1grow(i8** %ptr, i32 %ch) nounwind uwtable {
entry:
  %ptr.addr = alloca i8**, align 8
  %ch.addr = alloca i32, align 4
  store i8** %ptr, i8*** %ptr.addr, align 8
  store i32 %ch, i32* %ch.addr, align 4
  ret void
}
