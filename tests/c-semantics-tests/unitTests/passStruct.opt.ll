; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [8 x i8] c"BUG: 10\00"
@str14 = private unnamed_addr constant [8 x i8] c"BUG: 20\00"
@str15 = private unnamed_addr constant [8 x i8] c"BUG: 30\00"
@str16 = private unnamed_addr constant [8 x i8] c"BUG: 11\00"
@str17 = private unnamed_addr constant [8 x i8] c"BUG: 21\00"
@str18 = private unnamed_addr constant [8 x i8] c"BUG: 31\00"
@str19 = private unnamed_addr constant [8 x i8] c"BUG: 12\00"
@str20 = private unnamed_addr constant [8 x i8] c"BUG: 22\00"
@str21 = private unnamed_addr constant [8 x i8] c"BUG: 33\00"
@str22 = private unnamed_addr constant [9 x i8] c"BUG: 123\00"
@str24 = private unnamed_addr constant [4 x i8] c"End\00"

define i24 @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %0 = trunc i24 %z.coerce to i8
  %1 = lshr i24 %z.coerce, 16
  %sext.mask = and i24 %x.coerce, 255
  %cmp = icmp eq i24 %sext.mask, 10
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %sext.mask95 = and i24 %x.coerce, 65280
  %cmp5 = icmp eq i24 %sext.mask95, 5120
  br i1 %cmp5, label %if.end9, label %if.then7

if.then7:                                         ; preds = %if.end
  %puts101 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str14, i64 0, i64 0))
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then7
  %.mask = and i24 %x.coerce, -65536
  %cmp11 = icmp eq i24 %.mask, 1966080
  br i1 %cmp11, label %if.end15, label %if.then13

if.then13:                                        ; preds = %if.end9
  %puts102 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str15, i64 0, i64 0))
  br label %if.end15

if.end15:                                         ; preds = %if.end9, %if.then13
  %sext.mask96 = and i24 %y.coerce, 255
  %cmp18 = icmp eq i24 %sext.mask96, 11
  br i1 %cmp18, label %if.end22, label %if.then20

if.then20:                                        ; preds = %if.end15
  %puts103 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str16, i64 0, i64 0))
  br label %if.end22

if.end22:                                         ; preds = %if.end15, %if.then20
  %sext.mask97 = and i24 %y.coerce, 65280
  %cmp25 = icmp eq i24 %sext.mask97, 5376
  br i1 %cmp25, label %if.end29, label %if.then27

if.then27:                                        ; preds = %if.end22
  %puts104 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str17, i64 0, i64 0))
  br label %if.end29

if.end29:                                         ; preds = %if.end22, %if.then27
  %.mask98 = and i24 %y.coerce, -65536
  %cmp32 = icmp eq i24 %.mask98, 2031616
  br i1 %cmp32, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end29
  %puts105 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str18, i64 0, i64 0))
  br label %if.end36

if.end36:                                         ; preds = %if.end29, %if.then34
  %cmp39 = icmp eq i8 %0, 12
  br i1 %cmp39, label %if.end43, label %if.then41

if.then41:                                        ; preds = %if.end36
  %puts106 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str19, i64 0, i64 0))
  br label %if.end43

if.end43:                                         ; preds = %if.end36, %if.then41
  %2 = and i24 %z.coerce, 65280
  %cmp46 = icmp eq i24 %2, 5632
  br i1 %cmp46, label %if.end50, label %if.then48

if.then48:                                        ; preds = %if.end43
  %puts107 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str20, i64 0, i64 0))
  br label %if.end50

if.end50:                                         ; preds = %if.end43, %if.then48
  %cmp53 = icmp eq i24 %1, 32
  br i1 %cmp53, label %if.end57, label %if.then55

if.then55:                                        ; preds = %if.end50
  %puts108 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str21, i64 0, i64 0))
  br label %if.end57

if.end57:                                         ; preds = %if.end50, %if.then55
  %cmp58 = icmp eq i64 %l, 123
  br i1 %cmp58, label %if.end70, label %if.then60

if.then60:                                        ; preds = %if.end57
  %puts109 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str22, i64 0, i64 0))
  br label %if.end70

if.end70:                                         ; preds = %if.then60, %if.end57
  %3 = zext i24 %z.coerce to i32
  %mask72 = and i32 %3, 255
  %4 = zext i24 %1 to i32
  %5 = shl nuw nsw i32 %4, 16
  %ins73 = or i32 %mask72, %5
  %ins75 = or i32 %ins73, 19712
  %6 = trunc i32 %ins75 to i24
  ret i24 %6
}

define i32 @main() nounwind uwtable {
if.end31:
  %puts70 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @str24, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
